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

extern void vTaskCalculateInverse(void *pvParameters);

void vTesterTask( void *pvParameters )
{
  portSHORT lReceivedValue;
  LCDQueue_TYPE xLCDQueueItem;
  portBASE_TYPE xKeyPadQueueStatus;
  portBASE_TYPE xLCDQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;

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
        case 0:
          xLCDQueueItem.ucLineNumber = 0;
          strcpy(xLCDQueueItem.cString, "Cleared Line");
          xLCDQueueStatus = xQueueSendToBack( xLCDQueue, &xLCDQueueItem, xTicksToWait);
          break;
        case 1:
          xLCDQueueItem.ucLineNumber = 1;
          strcpy(xLCDQueueItem.cString, "First Line");
          xLCDQueueStatus = xQueueSendToBack( xLCDQueue, &xLCDQueueItem, xTicksToWait);
          break;
        case 2:
          xLCDQueueItem.ucLineNumber = 2;
          strcpy(xLCDQueueItem.cString, "Second Line");
          xLCDQueueStatus = xQueueSendToBack( xLCDQueue, &xLCDQueueItem, xTicksToWait);
          break;
          
        case 4:
          xTaskCreate(vTaskCalculateInverse, "Inverse Kinematics", 1000, NULL, 1, NULL); 
          break;
          
        case 8:
          vPrintToLCD(2,"tester!");
          xLCDQueueStatus = pdPASS;
          break;
        case 9:
          vPrintToLCD(2,"Second line mc mutha tester");
          xLCDQueueStatus = pdPASS;
          break;
        case 10:
          vPrintToLCD(1,"really Really reallY long string and if it ");
          xLCDQueueStatus = pdPASS;
          break;
        default:
          xLCDQueueStatus = pdPASS;
          break;
      }
      
      if( xLCDQueueStatus != pdPASS )
      {
        printf( "Could not send to the queue.\r\n");
      }
    }
    else
    {
      //printf( "Could not receive to the queue.\r\n");
    }
    taskYIELD();
  }
}

