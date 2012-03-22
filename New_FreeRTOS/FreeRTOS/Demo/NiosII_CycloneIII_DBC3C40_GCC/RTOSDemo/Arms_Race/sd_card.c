/* *
 * Pete Hemery
 * SD Card Functions
 * */
 
/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <ctype.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

/* PH added */
#include "altera_up_sd_card_avalon_interface.h"
#include "sd_card.h"
#include "LCD.h"


xQueueHandle xFileNameQueue = NULL;
xTaskHandle xFileNameHandle = NULL;

xQueueHandle xPlayQueue = NULL;

xQueueHandle xStringQueue = NULL;
xTaskHandle xStringHandle = NULL;


portBASE_TYPE xConnected = 0;
  
/*-----------------------------------*/
void vTaskSDCard(void *pvParameters)
{
  alt_up_sd_card_dev *device_reference = NULL;
  device_reference = alt_up_sd_card_open_dev(ALTERA_UP_SD_CARD_NAME);
  const portTickType xTicksToWait = 2000 / portTICK_RATE_MS;
  
  while(1) {
    vTaskDelay(xTicksToWait); // Chill out the for loop a bit
    if (device_reference != NULL) {
      if ((xConnected == pdFALSE) && (alt_up_sd_card_is_Present())) {
        printf("Card connected.\n");
        if (alt_up_sd_card_is_FAT16()) {
          printf("FAT16 file system detected.\n");
          xConnected = pdTRUE;
          
          /* Initialise Queues and Start Tasks */
          
          if (xStartReadFileNamesTask() != 0)
          {
            /* Could not start task */
            printf("vStartFileNameTask failed\n");
          }
          
        }
        else {
          printf("Unknown file system.\n");
        }
        xConnected = pdTRUE;
      }
      else if ((xConnected == pdTRUE) && (alt_up_sd_card_is_Present() == pdFALSE)) {
        printf("Card disconnected.\n");
        xConnected = pdFALSE;
        
        /* Remove items from Queues and delete Tasks */
        vEndReadFileNamesTask();
      }
    }
    else
    {
      printf("device_reference = NULL\n");
      break;
    }
    taskYIELD();
  }
  for (;;)
  {
    /* Loop endlessly until killed */
  }
  vTaskDelete( NULL );
}

/*-----------------------------------*/

portBASE_TYPE xStartReadFileNamesTask(void)
{
  xFileNameQueue = xQueueCreate( FILE_NAME_QUEUE_LENGTH, FILE_NAME_QUEUE_SIZE);
  if (xFileNameQueue == NULL)
  {
    /* Queue could not be created */
    printf("xFileNameQueue could not be created\n");
    return -1;
  }
  if ( xTaskCreate( vTaskReadFileNames,
                    "Read File Names",
                    FILE_NAME_STACK_SIZE,
                    NULL, /* No Parameters Passed */
                    1,    /* Priority - Just above idle */
                    &xFileNameHandle
                  ) != pdPASS )
  {
    /* The task could not be created, insufficient heap memory remaining */
    printf("vTaskReadFileNames could not be created\n");
    return -2;
  }
  return 0;
}

/*-----------------------------------*/

void vEndReadFileNamesTask(void)
{
  vTaskSuspend( xFileNameHandle );
  while (uxQueueMessagesWaiting( xFileNameQueue ) != 0)
  {
    /* Dump queue contents */
    xQueueReceive( xFileNameQueue, NULL, 0 );
  }
  /* Delete Queue and Task */
  vQueueDelete( xFileNameQueue );
  vTaskDelete( xFileNameHandle );
  
  /* Reset Queue and Handle variables */
  xFileNameQueue = NULL;
  xFileNameHandle = NULL;
}
/*-----------------------------------*/

void vTaskReadFileNames(void *pvParameters)
{
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portBASE_TYPE xNumberOfFiles = 0;
  portCHAR pcBufferName[FILE_NAME_MAX] = {0};
  portCHAR *pcPtr;
  portSHORT psHandler;
  portBASE_TYPE xStatus;

  /* Loop endlessly - sleeping when needed */
  for (;;)
  {
    /* Find the name of the SD card's root directory */
    psHandler = alt_up_sd_card_find_first("/.", pcBufferName);
    
    printf("SD CARD: %s\n\n List of Programs:\n\n", pcBufferName);
    
    /* Read every file looking for the .ARM file extension */
    while ((psHandler = alt_up_sd_card_find_next(pcBufferName)) != -1)
    {
      if ( (pcPtr = strstr(pcBufferName,".ARM")) != NULL)
      {
        /* Send file name to the queue */
        xStatus = xQueueSendToBack(xFileNameQueue, &pcBufferName, xTicksToWait);
        if( xStatus != pdPASS )
        {
          printf( "Could not send %s to xFileNameQueue.\n", pcBufferName);
        }
        else
        {
          /* Strip the .ARM extention off the file name for display */
          *pcPtr = '\0';
          printf("%s\n",pcBufferName);
          
          /* Keep a count of number of files for debug */
          xNumberOfFiles++;
        }
      }
    }
    
    /* All file names have been written */
    printf("\nNumber of files: %ld\n",xNumberOfFiles);
    
    /* Close the SD card file handle */
    alt_up_sd_card_fclose(psHandler);
    
    xNumberOfFiles = 0;
    /* Good Job, now sleep */
    vTaskSuspend( NULL );
    /* Once woken start again */
  }
  /* Task should be deleted externally when need be */
}

/*-----------------------------------*/

void vTaskReadFileContents(void *pvParameters)
{  
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portBASE_TYPE xStatus;
  portSHORT i;
  PlaySettings_TYPE xPlaySettings;

  /* Check if queue is ready */
  if( xPlayQueue == NULL )
  {
    printf( "xPlayQueue is not ready.\n");
    
    /* Fatal Error! */
    printf( "Deleting vTaskReadFileContents\n");
    vTaskDelete( NULL );
  }

  /* Check the queue isn't empty */
  while( uxQueueMessagesWaiting( xPlayQueue ) == 0)
  {
    printf( "xPlayQueue should not be empty!\n" );
    vTaskDelay(xTicksToWait);
  }
  
  /* Receive item from the queue */
  xStatus = xQueueReceive( xPlayQueue, &xPlaySettings, xTicksToWait );
  if( xStatus != pdPASS )
  {
    printf( "Could not receive from the xPlayQueue.\n");
    
    /* Fatal Error! */
    printf( "Deleting vTaskReadFileContents\n");
    vTaskDelete( NULL );
  }

  /* Check loop count is within sane limits */
  if (xPlaySettings.psLoopCount > 0 && xPlaySettings.psLoopCount < LOOP_MAX)
  { 
    /* Send all lines from the file the specified number of times */
    for (i=0; i<xPlaySettings.psLoopCount; i++)
    {
      if (xSendFileLines(xPlaySettings.pcFileName) != 0)
      {
        vTaskDelete( NULL );
      }
    }
  }
  /* If loop mode has been set to continuous */
  else if (xPlaySettings.psLoopCount == -1)
  {
    /* Continuously send all lines in the file */
    while(1)      /* TODO: Change this condition to respond to cancel */
    {
      if (xSendFileLines(xPlaySettings.pcFileName) != 0)
      {
        vTaskDelete( NULL );
      }
    }
  } 
  printf("Finished Playback\n");
  vTaskDelete( NULL );
}

/*-----------------------------------*/

portBASE_TYPE xSendFileLines(portCHAR *pcFileName)
{
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcRead;
  portCHAR pcFileLine[STRING_MAX] = {0};
  portCHAR *pcPtr;
  portSHORT psHandler;
  portBASE_TYPE xStatus;
  
  /* Initialise pointer with address of the buffer */
  pcPtr = pcFileLine;
  
  /* Check if the file is present & open it */
  if ((psHandler = alt_up_sd_card_fopen(pcFileName, false)) != -1)
  {
    /* Read file char by char */
    while ( (pcRead = (portCHAR)alt_up_sd_card_read(psHandler)) != -1)
    {
      /* Print the characer from the file */
      printf("%c", pcRead);
      /* Copy char from file to pcFileLine */
      *pcPtr = pcRead;
      /* Check for new line, if found then send string to the queue */
      if ( pcRead == '\n' )
      {
        xStatus = xQueueSendToBack(xStringQueue, &pcFileLine, xTicksToWait);
        if( xStatus != pdPASS )
        {
          printf( "Could not send to xStringQueue.\r\n");
        }
        /* Reset pointer to the beginning of the buffer */
        pcPtr = pcFileLine;
        /* NULL the buffer */
        bzero(pcFileLine,STRING_MAX);
      }
      else
      {
        /* Keep walking along the buffer */
        pcPtr++;
      }
    }
    /* Reached the end of the file */
    alt_up_sd_card_fclose(psHandler);
  }
  else
  {
    printf("File not found\n");
    vPrintToLCD(1,"File not found");
    return -1;
  }
  return 0;
}

/*-----------------------------------*/

portSHORT sCreateFile(portCHAR *pcFileName)
{
  portSHORT psHandler;
  
  /* Attempt to create file */
  if ((psHandler = alt_up_sd_card_fopen(pcFileName, true)) != -1)
  {
    /* File Created - Write New Line and save*/
    if ((alt_up_sd_card_write(psHandler, '\n')) != 1)
      printf("new line fail\n");
    
    alt_up_sd_card_fclose(psHandler);
    
    printf("%s created\n",pcFileName);
    
    psHandler = 0;
  }
  else
  {
    printf("file already exists\n");
  }
  return psHandler;
}

/*-----------------------------------*/

portSHORT sd_card_append_file(char *pcFileName, char *chars_to_write)
{
  portSHORT psHandler = -1;
  portSHORT read;
  portSHORT i = 0;
  portSHORT psStringLength = 0;
  
  if ((psStringLength = strlen(pcFileName)) == 0);
  {
    printf("File name = 0\n");
    return -1;
  }
  if ((psHandler = alt_up_sd_card_fopen(pcFileName, false)) != -1){
    /* Read to the end of the file */
    while ((read = alt_up_sd_card_read(psHandler)) != -1);
    for (i=0;i<psStringLength;i++)
    {
      if ((alt_up_sd_card_write(psHandler, chars_to_write[i])) != 1)
        printf("failed to write\n");
    }
    if ((alt_up_sd_card_write(psHandler, '\n')) != 1)
      printf("new line fail\n");
      
    /* Should set the handler to true */
    psHandler = alt_up_sd_card_fclose(psHandler);
  }
  else
  {
    printf("cannot open file\n");
  }
  return psHandler;
}

/*-----------------------------------*/

