/* *
 * Pete Hemery
 * UART Functions
 * */

/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

/* UART */
#include "altera_avalon_uart_regs.h"
#include "altera_avalon_uart.h"

#include "arm_com.h"

ArmControlFlag_t ArmControlFlag = WAITING_NOW; 

void vTaskArmCom(void *pvParameters)
{
  portBASE_TYPE xStatus = pdFALSE;
  const portTickType xTicksToWait = 200 / portTICK_RATE_MS;
  FILE* fp;
  portCHAR pcReceive[2] = {0};
  portBASE_TYPE xFinishedFlag = pdFALSE;
  /* Initialise the Queue Item */
  portCHAR pcArmQueueItem[STRING_MAX] = {0};
  
  /* Open the serial port with read/write capability */
  fp = fopen ("/dev/uart", "w+");
  if (fp!=NULL)
  {
    for(;;)
    {
      vTaskDelay(200 / portTICK_RATE_MS); // Chill the loop out
      
      if( uxQueueMessagesWaiting( xArmComQueue ) != 0)
      {
        //printf( "xArmComQueue should have been empty!\n" );
      }
      
      if (ArmControlFlag == WAITING_NOW)
      {
        /* Receive way point from the queue */
        xStatus = xQueueReceive( xArmComQueue, &pcArmQueueItem, xTicksToWait );
        
        /* Fall into the while loop below */
        xFinishedFlag = pdFALSE;
      }
      else
      /* If we aren't waiting then don't read the queue */
      {
        switch(ArmControlFlag)
        {
          case STOP_NOW:
            /* Send stop command */
            fprintf(fp,"\033");
            xStatus = pdFALSE;
            xFinishedFlag = pdTRUE;
            ArmControlFlag = WAITING_NOW;
            printf("STOP command received\n");
            break;
          case PAUSE_NOW:
            /* Send stop command */
            fprintf(fp,"\033");
            xStatus = pdFALSE;
            printf("PAUSE command received\n");
            break;
          case PLAY_NOW:
            /* Play button pressed
             * send previous command again */
            xStatus = pdTRUE;
            printf("RESUME command received\n");
            break;
            
          default:
            break;
        }
      }
      
      
      /* If an item becomes available, send it and wait for response. */
      if( xStatus == pdPASS )
      {
        printf( "ArmCom Received = %s\n", pcArmQueueItem);
        ArmControlFlag = PLAY_NOW;
        
        /* Send the command to the arm */
        fprintf(fp, pcArmQueueItem);
        
        while ( xFinishedFlag == pdFALSE && ArmControlFlag == PLAY_NOW)
        {
          vTaskDelay(100 / portTICK_RATE_MS);
          /* Query the Arm */
          fprintf(fp, "Q\r\n");
          
          vTaskDelay(100 / portTICK_RATE_MS);
          
          /* Upon query to the arm:
           * '.' is returned if move is complete,
           * '+' is returned if move is still in progress */
          bzero(pcReceive, 2);
          fread(pcReceive, 1, 1, fp);
          
          printf("received: %s\n",pcReceive);
          if (strncmp(pcReceive,".",1) == 0)
          {
            xFinishedFlag = pdTRUE;
            ArmControlFlag = WAITING_NOW;
          }
        }
        /* If the while loop was broken because of a key press
         * then respond accordingly */
        if (ArmControlFlag != WAITING_NOW)
          xFinishedFlag = pdFALSE;
      }
      else
      {
        /* If WAITING_NOW and here, we couldn't read the queue.
         * If not then a control button was pressed. */
         
        /*if (ArmControlFlag == WAITING_NOW)
          printf( "Could not receive from xArmComQueue.\n");
        */
      }
      taskYIELD();
    }
  }
  
  for(;;)
  {
    /* Error opening serial com */
    printf("Unable to open serial com\n");
    vTaskDelay(200 / portTICK_RATE_MS);
  }
  fclose(fp);
  vTaskDelete(NULL);
}
