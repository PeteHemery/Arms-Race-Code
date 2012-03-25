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

#define NUMBER_OF_CHOICES 2
#define TIMEOUT_VALUE 1

portCHAR pcProgramNames[100][FILE_NAME_MAX];

portBASE_TYPE xGetNumberOfFiles(void)
{
  portCHAR pcBufferName[FILE_NAME_MAX] = {0};
  portBASE_TYPE xFileNameQueueStatus;
  const portTickType xTicksToWait = 500 / portTICK_RATE_MS;
  portBASE_TYPE xTimeOut = TIMEOUT_VALUE;
  portBASE_TYPE xNumberOfFiles = 0;
  
  while(xTimeOut != 0)
  {
    if( uxQueueMessagesWaiting( xFileNameQueue ) != 0)
      {
        printf( "Queue should have been empty!\r\n" );
      }
      xFileNameQueueStatus = xQueueReceive( xFileNameQueue, &pcBufferName, xTicksToWait );
      if( xFileNameQueueStatus == pdPASS )
      {
        printf("\t%s\n",pcBufferName);
        xNumberOfFiles++;
      }
      else
      {
        xTimeOut--;
      }
  }
  return xNumberOfFiles;
}

void vTaskPlay( void *pvParameters )
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  enum xChoice_t {RECORD_A_PROGRAM, PLAY_A_PROGRAM} xChoice;
  portCHAR *pcChoices[] = 
  {
    "Loop Behaviour",
    "Play a Program"
  };
  portBASE_TYPE xNumOfFiles = 0;
  
  xChoice = 0;
  
  if (xSDConnected == pdFALSE)
  {
    printf("Please Insert SD Card!\n");
    vPrintToLCD(1,"Please Insert");
    vPrintToLCD(2,"SD Card!");
    while(xSDConnected != pdTRUE)
    {
      vTaskDelay( 100 / portTICK_RATE_MS);
      /* Wait until the card is inserted and read */
    }
    vPrintToLCD(1,"SD Card");
    vPrintToLCD(2,"Connected");
    
  }
  vTaskResume(xFileNameHandle);
  xNumOfFiles = xGetNumberOfFiles();
  printf("Play Task\n");
  if (xNumOfFiles == 0)
  {
    printf("No Files Available\n");
    vPrintToLCD(1,"No Files");
    vPrintToLCD(2,"Available");
    vTaskDelay( 3000 / portTICK_RATE_MS );
    
    xSystemState = MENU_SELECT;
    xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
    vTaskDelete(NULL);
  }
  else
  {
    vPrintToLCD(1,"Select a program");
  }

  
  for(;;)
  {
    if( uxQueueMessagesWaiting( xKeyPadQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xKeyPadQueueStatus = xQueueReceive( xKeyPadQueue, &sReceivedValue, xTicksToWait );
    if( xKeyPadQueueStatus == pdPASS )
    {
//      printf( "Received = %d \t", sReceivedValue);
      switch (sReceivedValue)
      {

        case RESET:
          vTaskReset();
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
          xSystemState = MENU_SELECT;
          xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
          vTaskDelete(NULL);
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
      printf( "xChoice %d\n", xChoice);
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
