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
#include "system_state.h"
#include "keypad.h"
#include "LCD.h"
#include "sd_card.h"


/**
* @brief Task Reset.
*
*   This function is called when the system initialises and when
*   the menu system is in an unknown state. Either at the beginning
*   or when the stop button has been pressed. 
*
* @param Void.
* @return Void.
*/
void vTaskReset(void)
{
  switch (xSystemState)
  {
    case MENU_SELECT:
      
      break;
    case RECORDING:
      break;
    case PLAYING:
      break;
      
    case WAITING_FOR_RESET:
      
      break;
      
    /* If we're resetting then return */
    case RESETTING:
      return;
      
    default:
      break;
  }
  //vArmCom(RESET);
  //vTaskEndScheduler();
  
}


/**
* @brief Wait for Reset.
*
*   This function waits for the user to press the reset button. 
*
* @param Void.
* @return Void.
*/
void vWaitForReset(void)
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portBASE_TYPE xResetPressed = 0;
  
  /* Wait for the user to insert an SD card */
  
  printf("Press Insert SD Card!\n");
  vPrintToLCD(1,"Please Insert");
  vPrintToLCD(2,"SD Card!");
  while(xSDConnected != pdTRUE)
  {
    vTaskDelay( 100 / portTICK_RATE_MS);
    /* Wait until the card is inserted and read */
  }
  printf("Press Reset to Begin\n");
  vPrintToLCD(1,"Press Reset");
  vPrintToLCD(2,"to begin");
  
  
  while(xResetPressed == 0)
  {
    if( uxQueueMessagesWaiting( xKeyPadQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xKeyPadQueueStatus = xQueueReceive( xKeyPadQueue, &sReceivedValue, xTicksToWait );
    if( xKeyPadQueueStatus == pdPASS )
    {
      switch (sReceivedValue)
      {
        case RESET:
        {
          
        /* TODO send park value */
        
          FILE* fp;
          fp = fopen ("/dev/uart", "w+");
          fprintf(fp, "#0 P1500\r");  //must send normal one first before group move
          fclose(fp);
          
          fp = fopen ("/dev/uart", "w+");
          fprintf(fp, RESET_STRING);
          fclose(fp);
          
          printf( "Resetting\n#0 P1500 #1 P1825 #2 P1618 #3 P951 #5 P1500 T2000\r\n");          
          usleep(1000000);
          //sleep(1);
          fclose(fp);
          //printf("Reset received\n");
          xResetPressed = 1;
          xSystemState = RESETTING;
          //vTaskReset();
          break;
        }
        default:
          break;
      }
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}
