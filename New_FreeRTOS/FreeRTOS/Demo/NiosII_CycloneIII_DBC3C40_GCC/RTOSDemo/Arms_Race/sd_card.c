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
#include "arm_com.h"

portBASE_TYPE xSDConnected = 0;
  
/*-----------------------------------*/
/* This function was modified from the Altera example */
void vTaskSDCard(void *pvParameters)
{
  alt_up_sd_card_dev *device_reference = NULL;
  device_reference = alt_up_sd_card_open_dev(ALTERA_UP_SD_CARD_NAME);
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  
  for(;;) {
    
    vTaskDelay(xTicksToWait); // Chill out the for loop a bit
    
    if (device_reference != NULL) {
      if ((xSDConnected == pdFALSE) && (alt_up_sd_card_is_Present())) {
        printf("Card connected.\n");
        if (alt_up_sd_card_is_FAT16()) {
          printf("FAT16 file system detected.\n");
          xSDConnected = pdTRUE;
        }
        else {
          printf("Unknown file system.\n");
        }
        xSDConnected = pdTRUE;
      }
      else if ((xSDConnected == pdTRUE) && (alt_up_sd_card_is_Present() == pdFALSE)) {
        printf("Card disconnected.\n");
        xSDConnected = pdFALSE;
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
/* Check should be performed for if SD card is present before calling this function */ 
portBASE_TYPE xGetFileNames(portCHAR pcFileNameList[NUMBER_OF_PROGS_MAX][FILE_NAME_MAX])
{
  portBASE_TYPE xNumberOfFiles = 0;
  portCHAR pcBufferName[FILE_NAME_MAX] = {0};
  portCHAR *pcPtr;
  portSHORT psHandler;

  /* Find the name of the SD card's root directory */
  psHandler = alt_up_sd_card_find_first("/.", pcBufferName);
  
  /* Check if first file is a program */
  if ( (pcPtr = strstr(pcBufferName,".ARM")) != NULL)
  {
    strcpy(pcFileNameList[xNumberOfFiles],pcBufferName);
    printf("%s\n",pcBufferName);
    
    /* Keep a count of number of files */
    xNumberOfFiles++;
  }
  
  printf("SD CARD: %s\n\n List of Programs:\n\n", pcBufferName);
  
  /* Read every file looking for the .ARM file extension */
  while ((psHandler = alt_up_sd_card_find_next(pcBufferName)) != -1)
  {
    if ( (pcPtr = strstr(pcBufferName,".ARM")) != NULL)
    {
      strcpy(pcFileNameList[xNumberOfFiles],pcBufferName);
      printf("%s\n",pcBufferName);
      
      /* Keep a count of number of files */
      xNumberOfFiles++;
    }
  }
  
  /* All file names have been written */
  printf("\nNumber of files: %ld\n",xNumberOfFiles);
  
  return xNumberOfFiles;
}

/*-----------------------------------*/
/* Used during play */
void vTaskReadFileContents(void *pvParameters)
{  
  portSHORT i;
  xPlaySettings_TYPE *xPlaySettings;
  portCHAR pcBuffer[5] = {0};
  
  xPlaySettings = (xPlaySettings_TYPE *) pvParameters;
 
  /* Check loop count is within sane limits */
  if (xPlaySettings->xLoopCount >= LOOP_MIN &&
      xPlaySettings->xLoopCount < LOOP_MAX)
  { 
    /* Send all lines from the file the specified number of times */
    for (i=0; i<xPlaySettings->xLoopCount; i++)
    {
      bzero(pcBuffer,5);
      sprintf(pcBuffer,"%d",i+1);
      vPrintToLCD(1,"Loop Count:");
      vPrintToLCD(2,pcBuffer);
      if (xGetFileLines(xPlaySettings->pcFileName) != 0)
      {
        printf("Could not open file!\n");
        break;
      }
    }
    xPlaySettings->xFinished = pdTRUE;
  }
  /* If loop mode has been set to continuous */
  else if (xPlaySettings->xLoopCount == 0)
  {
    /* Continuously send all lines in the file */
    while(ArmControlFlag == PLAY_NOW || ArmControlFlag == PAUSE_NOW)
    {
      vPrintToLCD(1,"Loop Count:");
      vPrintToLCD(2,"Continuous");
      if (xGetFileLines(xPlaySettings->pcFileName) != 0)
      {
        /* Stop was pressed */
        printf("Continuous playback interrupted\n");
        break;
      }
    }
  } 
  xPlaySettings->xFinished = pdTRUE;
  printf("Finished Playback\n");
  vTaskDelete( NULL );
}

/*-----------------------------------*/
/* Used during play */
portBASE_TYPE xGetFileLines(portCHAR *pcFileName)
{
  const portTickType xTicksToWait = 10000 / portTICK_RATE_MS;
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
    /* Opened the file */
    printf("Opened %s\n",pcFileName);
    /* Read file char by char */
    while ( (pcRead = alt_up_sd_card_read(psHandler)) != -1)
    {
      /* Print the characer from the file */
      printf("%c", pcRead);
      /* Copy char from file to pcFileLine */
      *pcPtr = pcRead;
      /* Check for carriage return, if found then send string to the queue */
      if ( *pcPtr == '\r' )
      {
        
        /* Wait for 10 seconds for previous queue item to be processed */
        xStatus = xQueueSendToBack(xArmComQueue, &pcFileLine, xTicksToWait);
        if( xStatus != pdPASS )
        {
          printf( "Could not send to xArmComQueue.\n");
        }
        /* Wait for Arm Com to pick up the message */
        vTaskDelay(100 / portTICK_RATE_MS);
        
        /* Wait until item has been processed */
        while(ArmControlFlag != WAITING_NOW)
        {
          vTaskDelay(100 / portTICK_RATE_MS);
          
          /* Check for button press action */
          if(ArmControlFlag == PAUSE_NOW)
          {
            printf("Playback interrupted\n");
            while(ArmControlFlag == PAUSE_NOW)
            {
              /* Wait for another button press */
              vTaskDelay(100 / portTICK_RATE_MS);
            }
            /* Pressed Play - resend last command */
            if (ArmControlFlag == PLAY_NOW)
            {
            /* Wait for 10 seconds for previous queue item to be processed */
              xStatus = xQueueSendToBack(xArmComQueue, &pcFileLine, xTicksToWait);
              if( xStatus != pdPASS )
              {
                printf( "Could not send to xArmComQueue.\n");
              }
            }
          }
          
          /* Stop pressed, get out! */
          if(ArmControlFlag == STOP_NOW)
          {
            printf("Emergency Stop!\n");
            return -1;
          }
          
          /* Reset pointer to the beginning of the buffer */
          pcPtr = pcFileLine;
          /* NULL the buffer */
          bzero(pcFileLine,STRING_MAX);
        }
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
/* Used during record */
portSHORT sCreateFile(portCHAR *pcFileName)
{
  portSHORT psHandler;
  portCHAR pcBufferName[FILE_NAME_MAX] = {0};
  
  /* Must open root before able to access SD Card */
  psHandler = alt_up_sd_card_find_first("/.", pcBufferName);
  
  /* Attempt to create file */
  if ((psHandler = alt_up_sd_card_fopen(pcFileName, true)) != -1)
  {
    /* File Created - Save it */
    alt_up_sd_card_fclose(psHandler);
    
    printf("%s created\n",pcFileName);
    
    return pdTRUE;
  }
  else
  {
    printf("file already exists\n");
    return pdFALSE;
  }
}

/*-----------------------------------*/
/* Used during record */
portSHORT psSDCardAppendFile(portCHAR *pcFileName, portCHAR *pcString, portBASE_TYPE xLen)
{
  portSHORT psHandler = -1;
  portSHORT read;
  portSHORT i = 0;
  
  portCHAR pcBufferName[FILE_NAME_MAX] = {0};
  
  if (xLen == 0)
  {
    printf("String length = 0\n");
    return pdFALSE;
  }
  
  /* Must open root before able to access SD Card */
  psHandler = alt_up_sd_card_find_first("/.", pcBufferName);
  
  if ((psHandler = alt_up_sd_card_fopen(pcFileName, false)) != -1){
    /* Read to the end of the file */
    while ((read = alt_up_sd_card_read(psHandler)) != -1);
    
    /* Write the new lines to the file */
    for (i=0;i<xLen;i++)
    {
      if ((alt_up_sd_card_write(psHandler, pcString[i])) != 1)
        printf("failed to write\n");
    }
    /* Save the contents of the file */
    alt_up_sd_card_fclose(psHandler);
    return pdTRUE;
  }
  else
  {
    printf("cannot open file\n");
    return pdFALSE;
  }
}

/*-----------------------------------*/

