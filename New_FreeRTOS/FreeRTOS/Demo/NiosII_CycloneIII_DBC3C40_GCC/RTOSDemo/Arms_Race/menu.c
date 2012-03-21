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

extern enum xSystemState;


void vWaitForReset(void)
{
  unsigned short lReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portBASE_TYPE xResetPressed = 0;
  
  while(xResetPressed == 0)
  {
    if( uxQueueMessagesWaiting( xKeyPadQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xKeyPadQueueStatus = xQueueReceive( xKeyPadQueue, &lReceivedValue, xTicksToWait );
    if( xKeyPadQueueStatus == pdPASS )
    {
      switch (lReceivedValue)
      {
        case RESET:
          printf("Reset received\n");
          xResetPressed = 1;
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

#define NUMBER_OF_CHOICES 2

void vTaskMenu( void *pvParameters )
{
  portSHORT lReceivedValue;
  //struct LCDQueue_TYPE xLCDQueueItem;
  portBASE_TYPE xKeyPadQueueStatus;
  //portBASE_TYPE xLCDQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcBuffer[STRING_MAX] = {0};
  enum xChoice_t {RECORD_A_PROGRAM, PLAY_A_PROGRAM} xChoice;
  portCHAR *pcChoices[] = {"Record a Program","Play a Program"};
  
  
  printf("Press Reset to Begin\n");
  vPrintToLCD(1,"Press Reset");
  vPrintToLCD(2,"to begin");
  
  vWaitForReset();
  
  xChoice = 0;
  vPrintToLCD(1,"Select Option:");
  vPrintToLCD(2,pcChoices[xChoice]);
  
  for(;;)
  {
    if( uxQueueMessagesWaiting( xKeyPadQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xKeyPadQueueStatus = xQueueReceive( xKeyPadQueue, &lReceivedValue, xTicksToWait );
    if( xKeyPadQueueStatus == pdPASS )
    {
      printf( "Received = %d \t xChoice %d\n", lReceivedValue ,xChoice);
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
          switch (xChoice)
          {
            case RECORD_A_PROGRAM:
              printf("%s\n",pcChoices[xChoice]);
              break;
            case PLAY_A_PROGRAM:
              printf("%s\n",pcChoices[xChoice]);
              break;
              default:
              break;
          }
          break;
        case CANCEL:
          break;
          
        case XUP:
        case UP:
        case XRIGHT:
        case RIGHT:
          if (++xChoice >= NUMBER_OF_CHOICES)
          {
            xChoice = 0;
          }
          break;
        case XDOWN:
        case DOWN:
        case XLEFT:
        case LEFT:
          --xChoice;
          if (xChoice < 0 || xChoice > NUMBER_OF_CHOICES)
          {
            xChoice = NUMBER_OF_CHOICES - 1;
          }
          break;
          
        default:
          break;
      }
      vPrintToLCD(2,pcChoices[xChoice]);
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
  
  
  for (;;)
  {
    /* Do nothing */
  }
  
   vTaskDelete(NULL);
}
