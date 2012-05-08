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
#include "system_state.h"

portBASE_TYPE xSDConnected = 0;

/**
* @brief SD Card Task.
*
*   This function was modified from the Altera example
*   It opens the SD card and if one is available sets a global
*   flag to indicate to the rest of the system the card is connected.
*
* @param [in] pvParameters Standard FreeRTOS void * parameters.
* @return Void.
*/
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


/**
* @brief Get File Names.
*
*   This function reads all the valid program names in the root directory
*   of the SD card and returns the number of valid files.
* 
*   pcFileNameList is a 2D array passed in that is populated with the list
*   of valid program names, for display during Playback Task.
* 
*   Check should be performed for if SD card is present before calling this function.
*
* @param [out] pcFileNameList Array of valid program names.
* @return portBASE_TYPE .
*/
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


/**
* @brief Read File Contents.
*
*   This task calls the function that reads the contents of the SD card.
*   It calls this function the number of times defined by LoopCount.
*   Used during playback.
*
* @param [in] pvParameters contains a struct xPlaySettings, containing
*             LoopCount, FileName and Finished Flag..
* @return Void.
*/
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
      vPrintToLCD(1,"Continuous Mode:");
      vPrintToLCD(2,"Playing");
        
      if (xGetFileLines(xPlaySettings->pcFileName) != 0)
      {
        /* Stop was pressed */
        printf("Continuous playback interrupted\n");
        /*
        xSystemState = WAITING_FOR_RESET;
        xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
        vTaskDelete(NULL);
        */
        break;
      }
      else
      {
        if (xSystemState == PLAYING)  //No Outside Intervention
        {
          ArmControlFlag = PLAY_NOW;
          continue;
        }
      }
    }
  } 
  xPlaySettings->xFinished = pdTRUE;
  printf("Finished Playback\n");
  vTaskDelete( NULL );
}


/**
* @brief Get File Lines.
*
*   This function reads the contents of the SD card and outputs
*   to the ARM Com task. Used during playback.
*
* @param [in] pcFileName File name of program to open.
* @return portBASE_TYPE indication of success or failure.
*/
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
    while ( ((pcRead = alt_up_sd_card_read(psHandler)) != -1) && xSystemState != WAITING_FOR_RESET)
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
            vPrintToLCD(1,"Emergency Stop!");
            vPrintToLCD(2,"Press Reset");
            alt_up_sd_card_fclose(psHandler);
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

/**
* @brief Create File.
*
*   This function checks the SD for relevant file names and
*   tries to create the file name specified in pcFileName.
*   If the file already exists then return value is -1, else
*   0 on successful creation. Used during record. 
*
* @param [in] pcFileName file name to try and create.
* @return portSHORT 0 on success, -1 on error.
*/
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

/**
* @brief Find New Filename.
*
*   This function checks the SD for relevant file names and
*   tries to create the file name specified in pcFileName.
*   If the file already exists then return value is -1, else
*   0 on successful creation. Used during record. 
*
* @param [in] pcFileName file name to try and create.
* @return portSHORT 0 on success, -1 on error.
*/
portSHORT sFindNewFilename(portCHAR *pcFileName)
{
  portSHORT psHandler;
  portCHAR pcBufferName[FILE_NAME_MAX] = {0};
  
  /* Must open root before able to access SD Card */
  psHandler = alt_up_sd_card_find_first("/.", pcBufferName);
  
  /* Attempt to create file */
  if ((psHandler = alt_up_sd_card_fopen(pcFileName, false)) != -1)
  {
    /* File opened - close it */
    alt_up_sd_card_fclose(psHandler);
    
    printf("%s exists\n",pcFileName);
    
    return pdFALSE;
  }
  else
  {
    printf("free filename found: %s\n",pcFileName);
    return pdTRUE;
  }
}

/**
* @brief SD Card Append File.
*
*   This function writes the characters contains in pcString to the end
*   of the file define by pcFileName. Used during record.
*
* @param [in] pcFileName File to append.
* @param [in] pcString String to write to end of the file.
* @param [in] xLen Length of the string to write.
* @return portSHORT Returns 0 on success, -1 on failure.
*/
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
