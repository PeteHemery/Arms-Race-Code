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
#include "record.h"
#include "arm_com.h"

#define NUMBER_OF_CHOICES 6

/* Local Function Prototypes */
portBASE_TYPE xSetAxisValue(xInverseStruct_t *pxInverseStruct);
portBASE_TYPE xSetAValue(xSetValueParam xValueParam, portBASE_TYPE *pxInValueIn);


void vTaskRecord( void *pvParameters )
{
  /* Messages */
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  
  /* Track which variables have been set */
  xWayPoint_t xWayPointFlags = {0};
  /* Initial values for variables */
  xInverseStruct_t xInverseStruct = {5, 3, 2, ""};
  portBASE_TYPE xGripValue = 1500;
  portBASE_TYPE xTimeValue = 1000;
  portBASE_TYPE xWaitValue = 1000;
  /* Menu choices */
  portCHAR *pcChoices[] = 
  {
    "Axis values",
    "Gripper value",
    "Time value",
    "Wait value",
    "Set Waypoint",
    "Exit"
  };
  xChoice_t xChoice = SELECT_AXIS;

  /* Get file name */
  portBASE_TYPE xFileNameFound = pdFALSE;
  portBASE_TYPE xProgNumber = 1;
  portCHAR pcFileName[FILE_NAME_MAX] = {0};
  /* Waypoint String */
  portCHAR pcWayPointString[OUTPUT_MAX] = {0};
  portCHAR pcWayPointTemp[20] = {0};
  portBASE_TYPE xLen = 0;
  
  while (xFileNameFound == pdFALSE)
  {
    sprintf(pcFileName,PROGRAM_NAME,xProgNumber);
    printf("filename: %s\n",pcFileName);
    xFileNameFound = sCreateFile(pcFileName);
    if (xFileNameFound == pdFALSE)
    {
      if (++xProgNumber == 999)
      {
        printf("Could not create new program!\n");
        for(;;)
        {
          printf("Error!\n");
        }
      }
    }
  }
  vPrintToLCD(1,"File Name:");
  vPrintToLCD(2,pcFileName);
  vTaskDelay(3000 / portTICK_RATE_MS);
  
  
  vPrintToLCD(1,"Select Option:");
  vPrintToLCD(2,pcChoices[xChoice]);

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
          
        case ENTER:
          switch (xChoice)
          {
            case SELECT_AXIS:
              xWayPointFlags.xAxisSet = xSetAxisValue(&xInverseStruct);
              break;
            case SELECT_GRIPPER:
              xWayPointFlags.xGripSet = xSetAValue(GRIP_VALUE, &xGripValue);
              break;
            case SELECT_TIME:
              xWayPointFlags.xTimeSet = xSetAValue(TIME_VALUE, &xTimeValue);
              break;
            case SELECT_WAIT:
              xWayPointFlags.xWaitSet = xSetAValue(WAIT_VALUE, &xWaitValue);
              break;
              
            case SET_WAYPOINT:
              printf("%s\n",pcChoices[xChoice]);
             
              bzero(pcWayPointString,OUTPUT_MAX);
              if (xWayPointFlags.xAxisSet == 1)
              {
                strcat(pcWayPointString,xInverseStruct.pcOutput);
              }
              if (xWayPointFlags.xGripSet == 1)
              {
                sprintf(pcWayPointTemp,"#5 P%ld ",xGripValue);
                strcat(pcWayPointString,pcWayPointTemp);
              }
              if (xWayPointFlags.xTimeSet == 1)
              {
                sprintf(pcWayPointTemp,"T%ld",xTimeValue);
                strcat(pcWayPointString,pcWayPointTemp);
              }
              /* Only append a \r\n if any values have been set */
              if (xWayPointFlags.xAxisSet ||
                  xWayPointFlags.xGripSet ||
                  xWayPointFlags.xTimeSet)
              {
                xWayPointFlags.xAxisSet = 0;
                xWayPointFlags.xGripSet = 0;
                xWayPointFlags.xTimeSet = 0;
                strcat(pcWayPointString,"\r\n");
              }
              if (xWayPointFlags.xWaitSet == 1)
              {
                xWayPointFlags.xWaitSet = 0;
                sprintf(pcWayPointTemp,"W%ld\r\n",xTimeValue);
                strcat(pcWayPointString,pcWayPointTemp);
              }
              if (pcWayPointString != NULL)
              {
                printf("string:\n%s\n",pcWayPointString);
              }
              /* Get the string length and write to the SD card */
              xLen = strlen(pcWayPointString);
              if ((sd_card_append_file(pcFileName, pcWayPointString, xLen)) != pdTRUE)
              {
                printf("Could not write to %s!\n",pcFileName);
                vPrintToLCD(2,"Waypoint Not Set!");
              }
              else
              {
                printf("Waypoint Set!\n");
                vPrintToLCD(2,"Waypoint Set!");
              }
              /* Wait while message is displayed */
              vTaskDelay(3000 / portTICK_RATE_MS);
              break;
              
            case SELECT_EXIT:
              printf("%s\n",pcChoices[xChoice]);
              printf("TODO Must end in reset position\n");
              
              xSystemState = MENU_SELECT;
              xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
              vTaskDelete(NULL);
              break;    
            default:
              break;
          }
          printf("xAxisSet\t%ld\txGripSet\t%ld\txTimeSet\t%ld\txWaitSet\t%ld\n",
          xWayPointFlags.xAxisSet,
          xWayPointFlags.xGripSet,
          xWayPointFlags.xTimeSet,
          xWayPointFlags.xWaitSet);
          break;
        case CANCEL:
          xSystemState = MENU_SELECT;
          xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
          vTaskDelete(NULL);
          break;
          
        case XDOWN:
        case DOWN:
        case XRIGHT:
        case RIGHT:
          if (++xChoice >= NUMBER_OF_CHOICES)
          {
            xChoice = 0;
          }
          break;
          
        case XUP:
        case UP:
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
      vPrintToLCD(1,"Select Option:");
      vPrintToLCD(2,pcChoices[xChoice]);
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}

/*----------------------------*/
portBASE_TYPE xSetAxisValue(xInverseStruct_t *xInverseStruct)
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcBuffer[STRING_MAX] = {0};
  portBASE_TYPE xStatus = pdFALSE;


  printf("Set Axis Values\n");
  vPrintToLCD(1,"Set Axis Values");
  sprintf(pcBuffer,"X:%d Y:%d Z:%d",xInverseStruct->X,
                                    xInverseStruct->Y,
                                    xInverseStruct->Z);
  vPrintToLCD(2,pcBuffer);

  strcpy(xInverseStruct->pcOutput,"NOT SET");
  printf("psX=%d psY=%d psZ=%d\npcOutput=%s\n",xInverseStruct->X,
                                               xInverseStruct->Y,
                                               xInverseStruct->Z,
                                               xInverseStruct->pcOutput);  
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
          ArmControlFlag = PLAY_NOW;
          break;
        case PAUSE:
          ArmControlFlag = PAUSE_NOW;
          break;
        case STOP:
          ArmControlFlag = STOP_NOW;
          break;
      /* Pressing Enter or Cancel exits this function
       * Return value determines if the value has been set or not */
        case ENTER:
          return 1;
        case CANCEL:
          return 0;
          
      /* Modify the Z axis */    
        case XUP:
          xInverseStruct->Z++;
          if (xInverseStruct->Z >= Z_MAX)
          {
            xInverseStruct->Z = Z_MAX;
          }
          printf("%d\tZ++;\n",xInverseStruct->Z);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->Z);
          vPrintToLCD(1,"Z Axis");
          vPrintToLCD(2,pcBuffer);
          break;
        case XDOWN:
          xInverseStruct->Z--;
          if (xInverseStruct->Z < 0 || xInverseStruct->Z > Z_MAX)
          {
            xInverseStruct->Z = 0;
          }
          printf("%d\tZ--;\n",xInverseStruct->Z);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->Z);
          vPrintToLCD(1,"Z Axis");
          vPrintToLCD(2,pcBuffer);
          break;
      
      /* Modify the Y axis */
        case UP:
          xInverseStruct->Y++;
          if (xInverseStruct->Y >= Y_MAX)
          {
            xInverseStruct->Y = Y_MAX;
          }
          printf("%d\tY++;\n",xInverseStruct->Y);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->Y);
          vPrintToLCD(1,"Y Axis");
          vPrintToLCD(2,pcBuffer);
          break;
        case DOWN:
          xInverseStruct->Y--;
          if (xInverseStruct->Y < 0 || xInverseStruct->Y > Y_MAX)
          {
            xInverseStruct->Y = 0;
          }
          printf("%d\tY--;\n",xInverseStruct->Y);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->Y);
          vPrintToLCD(1,"Y Axis");
          vPrintToLCD(2,pcBuffer);
          break;
          
      /* Modify the X axis */
        case XRIGHT:
        case RIGHT:
          xInverseStruct->X++;
          if (xInverseStruct->X >= X_MAX)
          {
            xInverseStruct->X = X_MAX;
          }
          printf("%d\tX++;\n",xInverseStruct->X);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->X);
          vPrintToLCD(1,"X Axis");
          vPrintToLCD(2,pcBuffer);
          break;
          
        case XLEFT:
        case LEFT:
          xInverseStruct->X--;
          if (xInverseStruct->X < 0 || xInverseStruct->X > X_MAX)
          {
            xInverseStruct->X = 0;
          }
          printf("%d\tX--;\n",xInverseStruct->X);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->X);
          vPrintToLCD(1,"X Axis");
          vPrintToLCD(2,pcBuffer);
          break;
          
        default:
          break;
      }
      bzero(xInverseStruct->pcOutput,OUTPUT_MAX);
      vCalculateInverse(xInverseStruct);
      printf("X=%d Y=%d Z=%d\npcOutput=%s\n",xInverseStruct->X,
                                             xInverseStruct->Y,
                                             xInverseStruct->Z,
                                             xInverseStruct->pcOutput);
      bzero(pcBuffer,STRING_MAX);
      strcpy(pcBuffer,xInverseStruct->pcOutput);
      
      /* Send updated servo values to the arm */
      xStatus = xQueueSendToBack( xArmComQueue, &pcBuffer, xTicksToWait);
      if( xStatus != pdPASS )
      {
        printf( "Could not send to the queue.\r\n");
      }
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}

/*----------------------------*/
portBASE_TYPE xSetAValue(xSetValueParam xValueParam, portBASE_TYPE *pxInValue)
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcBuffer[STRING_MAX] = {0};
  
  sprintf(pcBuffer,"%ld",*pxInValue);
  
  switch(xValueParam)
  {
    case GRIP_VALUE:
      printf("Grip Value\n");
      vPrintToLCD(1,"Grip Value");
      vPrintToLCD(2,pcBuffer);
      break;
    case TIME_VALUE:
      printf("Time Value\n");
      vPrintToLCD(1,"Time Value");
      vPrintToLCD(2,pcBuffer);
      break;
    case WAIT_VALUE:
      printf("Wait Value\n");
      vPrintToLCD(1,"Wait Value");
      vPrintToLCD(2,pcBuffer);
      break;
    default:
      break;
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
      /* Pressing Enter or Cancel exits this function
       * Return value determines if the value has been set or not */
        case ENTER:
          return 1;
        case CANCEL:
          return 0;
          
        case XUP:
        case XRIGHT:
          (*pxInValue) += 10;
          switch(xValueParam)
          {
            /* Limit the values to the upper max */
            case GRIP_VALUE:
              if ((*pxInValue) >= GRIP_MAX)
                (*pxInValue) = GRIP_MAX;
              printf("%ld\tGripValue++;\n",*pxInValue);
              break;
            case TIME_VALUE:
              if ((*pxInValue) >= TIME_MAX)
                (*pxInValue) = TIME_MAX;
              printf("%ld\tTimeValue++;\n",*pxInValue);
              break;
            case WAIT_VALUE:
              if ((*pxInValue) >= WAIT_MAX)
                (*pxInValue) = WAIT_MAX;
              printf("%ld\tWaitValue++;\n",*pxInValue);
              break;
            default:
              break;
          }
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%ld",*pxInValue);
          vPrintToLCD(2,pcBuffer);
          break;
          
        case XDOWN:
        case XLEFT:
          (*pxInValue) -= 10;
          switch(xValueParam)
          {
            /* Limit the values to the minimum.
             * Since enums are unsigned ints,
             *  need to check for greater than max
             *  since (0 - 1) = 4,294,967,295 */
            case GRIP_VALUE:
              if ((*pxInValue) < GRIP_MIN || (*pxInValue) > GRIP_MAX)
                (*pxInValue) = GRIP_MIN; 
              printf("%ld\tGripValue-10;\n",*pxInValue);
              break;
            case TIME_VALUE:
              if ((*pxInValue) < TIME_MIN || (*pxInValue) > TIME_MAX)
                (*pxInValue) = TIME_MIN; 
              printf("%ld\tTimeValue-10;\n",*pxInValue);
              break;
            case WAIT_VALUE:
              if ((*pxInValue) < WAIT_MIN || (*pxInValue) > WAIT_MAX)
                (*pxInValue) = WAIT_MIN;
              printf("%ld\tWaitValue-10;\n",*pxInValue);
              break;
            default:
              break;
          }
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%ld",*pxInValue);
          vPrintToLCD(2,pcBuffer);
          break;
          
        case UP:
        case RIGHT:
          (*pxInValue)++;
          switch(xValueParam)
          {
            /* Limit the values to the upper max */
            case GRIP_VALUE:
              if ((*pxInValue) >= GRIP_MAX)
                (*pxInValue) = GRIP_MAX;
              printf("%ld\tGripValue++;\n",*pxInValue);
              break;
            case TIME_VALUE:
              if ((*pxInValue) >= TIME_MAX)
                (*pxInValue) = TIME_MAX;
              printf("%ld\tTimeValue++;\n",*pxInValue);
              break;
            case WAIT_VALUE:
              if ((*pxInValue) >= WAIT_MAX)
                (*pxInValue) = WAIT_MAX;
              printf("%ld\tWaitValue++;\n",*pxInValue);
              break;
            default:
              break;
          }
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%ld",*pxInValue);
          vPrintToLCD(2,pcBuffer);
          break;
          
        case DOWN:
        case LEFT:
          (*pxInValue)--;
          switch(xValueParam)
          {
            /* Limit the values to the minimum.
             * Since enums are unsigned ints,
             *  need to check for greater than max
             *  since (0 - 1) = 4,294,967,295 */
            case GRIP_VALUE:
              if ((*pxInValue) < GRIP_MIN || (*pxInValue) > GRIP_MAX)
                (*pxInValue) = GRIP_MIN; 
              printf("%ld\tGripValue--;\n",*pxInValue);
              break;
            case TIME_VALUE:
              if ((*pxInValue) < TIME_MIN || (*pxInValue) > TIME_MAX)
                (*pxInValue) = TIME_MIN; 
              printf("%ld\tTimeValue--;\n",*pxInValue);
              break;
            case WAIT_VALUE:
              if ((*pxInValue) < WAIT_MIN || (*pxInValue) > WAIT_MAX)
                (*pxInValue) = WAIT_MIN;
              printf("%ld\tWaitValue--;\n",*pxInValue);
              break;
            default:
              break;
          }
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%ld",*pxInValue);
          vPrintToLCD(2,pcBuffer);
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
