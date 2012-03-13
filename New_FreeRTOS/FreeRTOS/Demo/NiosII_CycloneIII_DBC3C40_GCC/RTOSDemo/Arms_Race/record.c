/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "altera_avalon_lcd_16207_mod.h"
/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

/* Pete written */
#include "waypoints.h"
#include "keypad.h"
#include "LCD.h"
#include "sd_card.h"

void vTaskRecord( void *pvParameters )
{
  unsigned short lReceivedValue;
  //struct LCDQueue_TYPE xLCDQueueItem;
  portBASE_TYPE xKeyPadQueueStatus;
  portBASE_TYPE xLCDQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;

  printf("Record a Program\n");
  vPrintToLCD(1,"Record a Program");

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
          break;
        case CANCEL:
          break;
          
        case XUP:
        case UP:
          break;
        case XLEFT:
        case LEFT:
          break;
        case XDOWN:
        case DOWN:
          break;
        case XRIGHT:
        case RIGHT:
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

