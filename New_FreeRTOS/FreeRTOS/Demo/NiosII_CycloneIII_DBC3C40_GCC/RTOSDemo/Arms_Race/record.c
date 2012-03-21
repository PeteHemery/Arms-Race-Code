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
#include "altera_avalon_lcd_16207_mod.h"

/* Pete written */
#include "waypoints.h"
#include "keypad.h"
#include "LCD.h"
#include "sd_card.h"
#include "record.h"

void vTaskRecord( void *pvParameters )
{
  portSHORT lReceivedValue;
  //struct LCDQueue_TYPE xLCDQueueItem;
  portBASE_TYPE xKeyPadQueueStatus;
  //portBASE_TYPE xLCDQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcBuffer[STRING_MAX] = {0};
  
  portSHORT psX = 1;
  portSHORT psY = 1;
  portSHORT psZ = 1;

  printf("Record a Program\n");
  vPrintToLCD(1,"Record a Program =)");
  vPrintToLCD(2,"Line 2 - whoopsdeedoo");

  xInverseStruct_t xInverseStruct = {psX, psY, psZ, ""};
  strcpy(xInverseStruct.pcOutput,"Hi");
printf("psX=%d psY=%d psZ=%d pcOutput=%s\n",xInverseStruct.X,
                                                    xInverseStruct.Y,
                                                    xInverseStruct.Z,
                                                    xInverseStruct.pcOutput);
  for(;;)
  {
    if( uxQueueMessagesWaiting( xKeyPadQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xKeyPadQueueStatus = xQueueReceive( xKeyPadQueue, &lReceivedValue, xTicksToWait );
    if( xKeyPadQueueStatus == pdPASS )
    {
      printf( "Received = %d\r\n", lReceivedValue );
      switch (lReceivedValue)
      {

        case RESET:
          break;
        case PLAY:
          break;
        case PAUSE:
          break;
        case STOP:
          break;
          
        case ENTER:
          xInverseStruct.X = psX;
          xInverseStruct.Y = psY;
          xInverseStruct.Z = psZ;
          strcpy(xInverseStruct.pcOutput,"");
          
          if ((xTaskCreate(vTaskCalculateInverse, "Inverse Kinematics", 2000, &xInverseStruct, 1, NULL))
            != pdPASS) printf("couldn't run inverse in\n"); 
            
          break;
        case CANCEL:
        /*sprintf(pcBuffer,"psX=%d psY=%d psZ=%d pcOutput=%s\n",xInverseStruct.X,
                                                    xInverseStruct.Y,
                                                    xInverseStruct.Z,
                                                    xInverseStruct.pcOutput);*/
          vPrintToLCD(2,xInverseStruct.pcOutput);
          break;
          
        case XUP:
          psZ++;
          printf("%d psZ++;\n",psZ);
          break;
        case XDOWN:
          psZ--;
          printf("%d psZ--;\n",psZ);
          break;
          
        case UP:
          psY++;
          printf("%d psY++;\n",psY);
          break;
        case DOWN:
          psY--;
          printf("%d psY--;\n",psY);
          break;
          
        case XRIGHT:
        case RIGHT:
          psX++;
          printf("%d psX++;\n",psX);
          break;
          
        case XLEFT:
        case LEFT:
          psX--;
          printf("%d psX--;\n",psX);
          break;
          
        default:
          break;
      }
      printf("psX=%d psY=%d psZ=%d pcOutput=%s\n",xInverseStruct.X,
                                                    xInverseStruct.Y,
                                                    xInverseStruct.Z,
                                                    xInverseStruct.pcOutput);
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}

