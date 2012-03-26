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
#include "arm_com.h"

#define TIMEOUT_VALUE 1

/* Local Prototypes */
void vTaskPlay( void *pvParameters );
portBASE_TYPE xSetLoopCount(void);
void vPlayProgram(portCHAR *pcFileName, portBASE_TYPE xLoopCount);

/*---------------------*/
void vTaskPlay( void *pvParameters )
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portBASE_TYPE xChoice = 0;
  
  portBASE_TYPE xNumOfFiles = 0;
  /* List of program names */
  portCHAR pcProgramNameList[NUMBER_OF_PROGS_MAX][FILE_NAME_MAX] = {{0}};
  
  portBASE_TYPE xLoopCount = 1;
  
  /* Check if SD Card is connected */
  if (xSDConnected == pdFALSE)
  {
    printf("Please Insert SD Card!\n");
    vPrintToLCD(1,"Please Insert");
    vPrintToLCD(2,"SD Card!");
    while(xSDConnected != pdTRUE)
    {
      vTaskDelay( 200 / portTICK_RATE_MS);
      /* Wait until the card is inserted and read */
    }
    vPrintToLCD(1,"SD Card");
    vPrintToLCD(2,"Connected");
    
  }
  
  /* Reads the list of files */
  xNumOfFiles = xGetFileNames(pcProgramNameList);
  
  printf("Play Task\n");
  if (xNumOfFiles == 0)
  {
    printf("No Files Available\n");
    vPrintToLCD(1,"No Files");
    vPrintToLCD(2,"Available");
    vTaskDelay( 3000 / portTICK_RATE_MS );
    
    /* Go back to the menu */
    xSystemState = MENU_SELECT;
    xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
    vTaskDelete(NULL);
  }
  else
  {
    vPrintToLCD(1,"Select a program");
    vPrintToLCD(2,pcProgramNameList[xChoice]);
  }

  /* Listed the first program name. Now select one! */
  
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
          printf("%s\n",pcProgramNameList[xChoice]);
          xLoopCount = xSetLoopCount();
          printf("Loop Count = %ld\n",xLoopCount);
          
          /* Launch playback task */
          vPlayProgram(pcProgramNameList[xChoice], xLoopCount);
          
          vPrintToLCD(1,"Play Finished");
          vTaskDelay(3000 / portTICK_RATE_MS);
          xSystemState = MENU_SELECT;
          xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
          vTaskDelete(NULL);
          break;
          
        case CANCEL:
          vPrintToLCD(1,"Cancalled");
          xSystemState = MENU_SELECT;
          xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
          vTaskDelete(NULL);
          break;
          
        case XDOWN:
        case DOWN:
        case XRIGHT:
        case RIGHT:
          if (++xChoice >= xNumOfFiles)
          {
            xChoice = 0;
          }
          break;
          
        case XUP:
        case UP:
        case XLEFT:
        case LEFT:
          --xChoice;
          if (xChoice < 0 || xChoice > xNumOfFiles)
          {
            xChoice = xNumOfFiles - 1;
          }
          break;
          
        default:
          break;
      }
      printf( "xChoice %ld\n", xChoice);
      vPrintToLCD(2,pcProgramNameList[xChoice]);
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

/*----------------------------*/
portBASE_TYPE xSetLoopCount(void)
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcBuffer[STRING_MAX] = {0};
  portBASE_TYPE xLoopCount = 1;
  
  sprintf(pcBuffer,"%ld",xLoopCount);
  

  printf("Set Loop Count\n");
  vPrintToLCD(1,"Loop Count:");
  vPrintToLCD(2,pcBuffer);
  

  for(;;)
  {
    if( uxQueueMessagesWaiting( xKeyPadQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xKeyPadQueueStatus = xQueueReceive( xKeyPadQueue, &sReceivedValue, xTicksToWait );
    if( xKeyPadQueueStatus == pdPASS )
    {
      printf( "Received = %d\r\n", sReceivedValue );
      switch (sReceivedValue)
      {

        case RESET:
          break;
        case PLAY:
          break;
        case PAUSE:
          break;
        case STOP:
          break;
        case CANCEL:
          //break;
      /* Pressing Enter or cancel exits this function.
       * Return xLoopCount */
        case ENTER:
          return xLoopCount;
          
        case XUP:
          if (xLoopCount != 0)
          {
            xLoopCount += 10;
            
            if (xLoopCount >= LOOP_MAX)
              xLoopCount = LOOP_MAX;
            printf("%ld\tLoopCount+10;\n",xLoopCount);
            
            bzero(pcBuffer,STRING_MAX);
            sprintf(pcBuffer,"%ld",xLoopCount);
          }
          break;
          
        case XDOWN:
          if (xLoopCount != 0)
          {
            xLoopCount -= 10;
            /* Limit the values to the minimum.
             * Since enums are unsigned ints,
             *  need to check for greater than max
             *  since (0 - 1) = 4,294,967,295 */
            if (xLoopCount < LOOP_MIN || xLoopCount > LOOP_MAX)
              xLoopCount = LOOP_MIN;
            printf("%ld\tLoopCount-10;\n",xLoopCount);
      
            bzero(pcBuffer,STRING_MAX);
            sprintf(pcBuffer,"%ld",xLoopCount);
          }
          break;
          
        case UP:
          if (xLoopCount != 0)
          {
            xLoopCount++;
              /* Limit the values to the upper max */
            if (xLoopCount >= LOOP_MAX)
              xLoopCount = LOOP_MAX;
            printf("%ld\tLoopCount++;\n",xLoopCount);
  
            bzero(pcBuffer,STRING_MAX);
            sprintf(pcBuffer,"%ld",xLoopCount);
          }
          break;
          
        case DOWN:
          if (xLoopCount != 0)
          {
            xLoopCount--;
            /* Limit the values to the minimum.
             * Since enums are unsigned ints,
             *  need to check for greater than max
             *  since (0 - 1) = 4,294,967,295 */
        
            if (xLoopCount < LOOP_MIN || xLoopCount > LOOP_MAX)
              xLoopCount = LOOP_MIN;
            printf("%ld\tLoopCount--;\n",xLoopCount);
        
            bzero(pcBuffer,STRING_MAX);
            sprintf(pcBuffer,"%ld",xLoopCount);
          }
          break;
          
        case XRIGHT:
        case RIGHT:
        case XLEFT:
        case LEFT:
          if (xLoopCount != 0)
          {
            xLoopCount = 0;
            bzero(pcBuffer,STRING_MAX);
            sprintf(pcBuffer,"Continuous");
          }
          else
          {
            xLoopCount = 1;
            bzero(pcBuffer,STRING_MAX);
            sprintf(pcBuffer,"%ld",xLoopCount);
          }
          break;
        
        
        default:
          break;
      }
      vPrintToLCD(2,pcBuffer);
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}

/*----------------------------*/
void vPlayProgram(portCHAR *pcFileName, portBASE_TYPE xLoopCount)
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  
  xPlaySettings_TYPE xPlaySettings;
  strcpy(xPlaySettings.pcFileName, pcFileName);
  xPlaySettings.xLoopCount = xLoopCount;
  xPlaySettings.xFinished = pdFALSE;
  xTaskHandle xReadFileContentsHandle;
  
  xTaskCreate(vTaskReadFileContents,
              "Read File Contents",
              2000,
              &xPlaySettings,
              1,
              &xReadFileContentsHandle);
              
  while(xPlaySettings.xFinished == pdFALSE)
  {
    /* Wait until playback has been finished */
    vTaskDelay(500 / portTICK_RATE_MS);
    /* Read the keypad, waiting for pause, play or stop */
    if( uxQueueMessagesWaiting( xKeyPadQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xKeyPadQueueStatus = xQueueReceive( xKeyPadQueue, &sReceivedValue, xTicksToWait );
    if( xKeyPadQueueStatus == pdPASS )
    {
      printf( "Received = %d\r\n", sReceivedValue );
      switch (sReceivedValue)
      {
        case PLAY:
          ArmControlFlag = PLAY_NOW;
          break;
        case PAUSE:
          ArmControlFlag = PAUSE_NOW;
          break;
        case STOP:
          ArmControlFlag = STOP_NOW;
          xPlaySettings.xFinished = pdTRUE;
          break;
        default:
          break;
      }
    }
  }
}
