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
#include "waypoints.h"
#include "keypad.h"
#include "LCD.h"
#include "sd_card.h"

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
  vTaskEndScheduler();
  
}

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
  while(xConnected != pdTRUE)
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
          printf("Reset received\n");
          xResetPressed = 1;
          xSystemState = RESETTING;
          //vTaskReset();
          break;
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
