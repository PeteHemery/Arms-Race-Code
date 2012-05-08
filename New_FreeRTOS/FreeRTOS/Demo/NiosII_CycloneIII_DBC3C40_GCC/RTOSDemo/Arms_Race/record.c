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
#include "record.h"
#include "arm_com.h"

#define NUMBER_OF_CHOICES 7
#define SERVO_CHOICES 5

#define X_ORIG  50
#define Y_ORIG  50
#define Z_ORIG  8

#define RECORD_SPEED 700

/* Global variable of Servo Values, shared with Inverse Kinematics function */

portSHORT psServoValues[6] = { 1500, 2000, 2000, 1600, 1550, 1000};
  

/**
* @brief Recording Task.
*
*   This function is responsible for recording waypoints received from user
*   input to the SD card, for later playback.
*
* @param [in] pvParameters Standard FreeRTOS void * method of passing parameters.
* @return Void.
*/

void vTaskRecord( void *pvParameters )
{
  /* Messages */
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  
  /* Track which variables have been set */
  xWayPoint_t xWayPointFlags = {0};
  portBASE_TYPE xFileCreated = pdFALSE;
  
  /* Initial values for variables */
  xInverseStruct_t xInverseStruct = {X_ORIG, Y_ORIG, Z_ORIG, ""};
  portBASE_TYPE xTimeValue = 1000;
  portBASE_TYPE xWaitValue = 1000;
  /* Menu choices */
  portCHAR *pcChoices[] = 
  {
    "Servo Values",
    "Axis values",
    "Gripper value",
    "Time value",
    "Wait value",
    "Set Waypoint",
    "Exit"
  };
  xChoice_t xChoice = SELECT_SERVOS;

  /* Get file name */
  portBASE_TYPE xFileNameFound = pdFALSE;
  portBASE_TYPE xProgNumber = 1;
  portCHAR pcFileName[FILE_NAME_MAX] = {0};
  portCHAR pcBuffer[STRING_MAX] = {0};
  /* Waypoint String */
  portCHAR pcWayPointString[OUTPUT_MAX] = {0};
  portCHAR pcWayPointTemp[20] = {0};
  portBASE_TYPE xLen = 0;

  portBASE_TYPE xStatus = pdFALSE;
  
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
  }
  
  while (xFileNameFound == pdFALSE)
  {
          FILE* fp;
          fp = fopen ("/dev/uart", "w+");
    sprintf(pcFileName,PROGRAM_NAME,xProgNumber);
    printf("filename: %s\n",pcFileName);
    //xFileNameFound = sCreateFile(pcFileName);
    xFileNameFound = sFindNewFilename(pcFileName);
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
            case SELECT_SERVOS:
              xWayPointFlags.xServosSet = vSelectServos();
              
              /*Mutually Exclusive settings of Servos and Axis values*/
              if (xWayPointFlags.xServosSet == 1) 
                xWayPointFlags.xAxisSet = 0;
              break;
              
            case SELECT_AXIS:
              xWayPointFlags.xAxisSet = xSetAxisValue(&xInverseStruct);
              if (xWayPointFlags.xAxisSet == 1)
                xWayPointFlags.xServosSet = 0;
              break;
              
            case SELECT_GRIPPER:
              xWayPointFlags.xGripSet = xSetGripValue();
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
              if (xWayPointFlags.xServosSet == 1)
              {
                sprintf(pcWayPointString,"#0 P%d #1 P%d #2 P%d #3 P%d ",
                                              psServoValues[0],
                                              psServoValues[1],
                                              psServoValues[2],
                                              psServoValues[3]);
              }
              if (xWayPointFlags.xAxisSet == 1)
              {
                strcat(pcWayPointString,xInverseStruct.pcOutput);
              }
              if (xWayPointFlags.xGripSet == 1)
              {
                sprintf(pcWayPointTemp,"#5 P%d ",psServoValues[5]);
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
              
              if (xFileCreated == pdFALSE)
              {
                xFileCreated = sCreateFile(pcFileName);
              }
              
              if ((psSDCardAppendFile(pcFileName, pcWayPointString, xLen)) != pdTRUE)
              {
                printf("Could not write to %s!\n",pcFileName);
                vPrintToLCD(2,"Waypoint Not Set!");
              }
              else
              {
                printf("Waypoint Set!\n");
                vPrintToLCD(2,"Waypoint Set!");
              }
              /* Reset menu selection choice */
              xChoice = SELECT_SERVOS;
              /* Wait while message is displayed */
              vTaskDelay(3000 / portTICK_RATE_MS);
              break;
              
            case SELECT_EXIT:
              printf("%s\n",pcChoices[xChoice]);
              printf("TODO Must end in reset position\n");
               
               /* Reset Arm Position */ 
              bzero(pcBuffer,STRING_MAX);
              sprintf(pcBuffer,RESET_STRING); 
        
              /* Send updated servo values to the arm */
              xStatus = xQueueSendToBack( xArmComQueue, &pcBuffer, xTicksToWait);
              if( xStatus != pdPASS )
              {
                printf( "Could not send to the queue.\r\n");
              }
  
              
              xSystemState = MENU_SELECT;
              xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
              vTaskDelete(NULL);
              break;    
            default:
              break;
          }
          printf("xServosSet\t%ld\txAxisSet\t%ld\txGripSet\t%ld\txTimeSet\t%ld\txWaitSet\t%ld\n",
          xWayPointFlags.xServosSet,
          xWayPointFlags.xAxisSet,
          xWayPointFlags.xGripSet,
          xWayPointFlags.xTimeSet,
          xWayPointFlags.xWaitSet);
          break;
        case CANCEL:
          xSystemState = MENU_SELECT;
           
           /* Reset Arm Position */ 
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,RESET_STRING); 
    
          /* Send updated servo values to the arm */
          xStatus = xQueueSendToBack( xArmComQueue, &pcBuffer, xTicksToWait);
          if( xStatus != pdPASS )
          {
            printf( "Could not send to the queue.\r\n");
          }
          
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


portBASE_TYPE vSelectServos(void)
{
  /* Messages */
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
    
  /* Menu choices */
  portCHAR *pcChoices[] = 
  {
    "Base",
    "Shoulder",
    "Elbow",
    "Wrist",
    "Exit"
  };
  xServoChoice_t xChoice = SELECT_BASE;

  portBASE_TYPE xServosSet = pdFALSE;
    
  vPrintToLCD(1,"Select Servo:");
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
            case SELECT_BASE:
            case SELECT_SHOULDER:
            case SELECT_ELBOW:
            case SELECT_WRIST:
              xServosSet = pdTRUE; 
              xSetServoValue((portSHORT)xChoice);
              break;
                            
            case SERVO_EXIT:
              printf("%s\n",pcChoices[xChoice]);
              return xServosSet;
              //break;
                  
            default:
              break;
          }
          printf("xServosSet\t%ld\n", xServosSet);
          break;
        case CANCEL:
          return xServosSet;
          //break;
          
        case XDOWN:
        case DOWN:
        case XRIGHT:
        case RIGHT:
          if (++xChoice >= SERVO_CHOICES)
          {
            xChoice = 0;
          }
          break;
          
        case XUP:
        case UP:
        case XLEFT:
        case LEFT:
          --xChoice;
          if (xChoice < 0 || xChoice > SERVO_CHOICES)
          {
            xChoice = SERVO_CHOICES - 1;
          }
          break; 
        default:
        
          break;
      }
      vPrintToLCD(1,"Select Servo:");
      vPrintToLCD(2,pcChoices[xChoice]);
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}

/**
* @brief Set Servo value.
*
*   This function is used to set the servo values of the arm.
*
* @param [in] void.
* @param [out] void. 
* @return Void.
*/
void xSetServoValue(portSHORT pcServoNumber)
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcBuffer[STRING_MAX] = {0};
  portBASE_TYPE xStatus = pdFALSE;
 
  printf("Servo %d:\n",pcServoNumber);
  sprintf(pcBuffer,"Servo %d:",pcServoNumber);
  vPrintToLCD(1,pcBuffer);
  bzero(pcBuffer,STRING_MAX);
  sprintf(pcBuffer,"%d",psServoValues[pcServoNumber]);
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

        case ENTER:
        case CANCEL:
          return;
          
        case XUP:
        case XRIGHT:
          
          psServoValues[pcServoNumber] += 500;
        
        /* Limit the values to the upper max */
          if ((psServoValues[pcServoNumber]) >= SERVO_MAX)
            psServoValues[pcServoNumber] = SERVO_MAX;
          printf("Servo %d Value+500\n",pcServoNumber);

          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",psServoValues[pcServoNumber]);
          break;
          
        case XDOWN:
        case XLEFT:
          psServoValues[pcServoNumber] -= 500;
         
            /* Limit the values to the minimum.
             * Since enums are unsigned ints,
             *  need to check for greater than max
             *  since (0 - 1) = 4,294,967,295 */
          if (psServoValues[pcServoNumber] < SERVO_MIN || psServoValues[pcServoNumber] > SERVO_MAX)
            psServoValues[pcServoNumber] = SERVO_MIN; 
          printf("Servo %d Value-500\n",pcServoNumber);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",psServoValues[pcServoNumber]);
          break;
          
        case UP:
        case RIGHT:
          
          psServoValues[pcServoNumber] += 50;
        
        /* Limit the values to the upper max */
          if ((psServoValues[pcServoNumber]) >= SERVO_MAX)
            psServoValues[pcServoNumber] = SERVO_MAX;
          printf("Servo %d Value+50\n",pcServoNumber);

          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",psServoValues[pcServoNumber]);
          break;
          
        case DOWN:
        case LEFT:
          psServoValues[pcServoNumber] -= 50;
         
            /* Limit the values to the minimum.
             * Since enums are unsigned ints,
             *  need to check for greater than max
             *  since (0 - 1) = 4,294,967,295 */
          if (psServoValues[pcServoNumber] < SERVO_MIN || psServoValues[pcServoNumber] > SERVO_MAX)
            psServoValues[pcServoNumber] = SERVO_MIN; 
          printf("Servo %d Value-50\n",pcServoNumber);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",psServoValues[pcServoNumber]);
          break;
          
        default:
          break;
      }
      vPrintToLCD(2,pcBuffer);
    
      bzero(pcBuffer,STRING_MAX);
      sprintf(pcBuffer,"#%d P%d T%d\r",pcServoNumber,psServoValues[pcServoNumber],RECORD_SPEED);
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



/**
* @brief Set Axis Values.
*
*   This function is used to modify the X, Y and Z co-ordinates, and
*   sending the values to the arm as they change.
*
* @param [in] xInverseStruct Pointer to struct containing X, Y & Z values.
* @return portBASE_TYPE Enter returns 1, cancel returns 0. These represent
*         if the axis values shall be saved when a waypoint is created.
*/
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

  vCalculateInverse(xInverseStruct);
  printf("psX=%d psY=%d psZ=%d\npcOutput=%s\n",xInverseStruct->X,
                                               xInverseStruct->Y,
                                               xInverseStruct->Z,
                                               xInverseStruct->pcOutput);
  bzero(pcBuffer,STRING_MAX);
  sprintf(pcBuffer,"%s T%d\r",xInverseStruct->pcOutput,RECORD_SPEED);
  strcpy(xInverseStruct->pcOutput,pcBuffer);
  
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
          xInverseStruct->Z+=10;
          if (xInverseStruct->Z >= Z_MAX)
          {
            xInverseStruct->Z = Z_MAX;
          }
          printf("%d\tZ+=10;\n",xInverseStruct->Z);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->Z);
          vPrintToLCD(1,"Z Axis");
          vPrintToLCD(2,pcBuffer);
          break;
        case XDOWN:
          xInverseStruct->Z-=10;
          if (xInverseStruct->Z < Z_MIN || xInverseStruct->Z > Z_MAX)
          {
            xInverseStruct->Z = Z_MIN;
          }
          printf("%d\tZ-=10;\n",xInverseStruct->Z);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->Z);
          vPrintToLCD(1,"Z Axis");
          vPrintToLCD(2,pcBuffer);
          break;
      
      /* Modify the Y axis */
        case UP:
          xInverseStruct->Y+=10;
          if (xInverseStruct->Y >= Y_MAX)
          {
            xInverseStruct->Y = Y_MAX;
          }
          printf("%d\tY+=10;\n",xInverseStruct->Y);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->Y);
          vPrintToLCD(1,"Y Axis");
          vPrintToLCD(2,pcBuffer);
          break;
        case DOWN:
          xInverseStruct->Y-=10;
            if (xInverseStruct->Y < Y_MIN || xInverseStruct->Y > Y_MAX)
          {
            xInverseStruct->Y = Y_MIN;
          }
          printf("%d\tY-=10;\n",xInverseStruct->Y);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->Y);
          vPrintToLCD(1,"Y Axis");
          vPrintToLCD(2,pcBuffer);
          break;
          
      /* Modify the X axis */
        case XLEFT:
        case LEFT:
          xInverseStruct->X+=10;
          if (xInverseStruct->X >= X_MAX)
          {
            xInverseStruct->X = X_MAX;
          }
          printf("%d\tX+=10;\n",xInverseStruct->X);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->X);
          vPrintToLCD(1,"X Axis");
          vPrintToLCD(2,pcBuffer);
          break;
          
        case XRIGHT:
        case RIGHT:
          xInverseStruct->X-=10;
          if (xInverseStruct->X < X_MIN || xInverseStruct->X > X_MAX)
          {
            xInverseStruct->X = X_MIN;
          }
          printf("%d\tX-=10;\n",xInverseStruct->X);
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",xInverseStruct->X);
          vPrintToLCD(1,"X Axis");
          vPrintToLCD(2,pcBuffer);
          break;
          
        default:
          break;
      }
      bzero(xInverseStruct->pcOutput,OUTPUT_MAX);
      
      printf("X=%d Y=%d Z=%d\npcOutput=%s\n",xInverseStruct->X,
                                             xInverseStruct->Y,
                                             xInverseStruct->Z,
                                             xInverseStruct->pcOutput);
      
      if (vCalculateInverse(xInverseStruct))
      {
        bzero(pcBuffer,STRING_MAX);
        sprintf(pcBuffer,"%s T%d\r",xInverseStruct->pcOutput, RECORD_SPEED);
        
        /* Send updated servo values to the arm */
        xStatus = xQueueSendToBack( xArmComQueue, &pcBuffer, xTicksToWait);
        if( xStatus != pdPASS )
        {
          printf( "Could not send to the queue.\r\n");
        }
      }
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}


/**
* @brief Set a value.
*
*   This function is used to set the values of the gripper of the arm,
*   the time taken for an entire movement, and the wait value once
*   a movement has been completed.
*   
*   Since the functionality to set these values is similar, they have
*   been grouped into one function and a switch is used to determine
*   while value is the one being modified.  
*
* @param [in] xValueParam enumeration, containing which value to change.
* @param [out] pxInValue Contains the updated value. 
* @return Void.
*/
portBASE_TYPE xSetAValue(xSetValueParam xValueParam, portBASE_TYPE *pxInValue)
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcBuffer[STRING_MAX] = {0};
  
  sprintf(pcBuffer,"%ld",*pxInValue);
  
  switch(xValueParam)
  {
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
          (*pxInValue) += 100;
          switch(xValueParam)
          {
            /* Limit the values to the upper max */
            case TIME_VALUE:
              if ((*pxInValue) >= TIME_MAX)
                (*pxInValue) = TIME_MAX;
              printf("%ld\tTimeValue+100;\n",*pxInValue);
              break;
            case WAIT_VALUE:
              if ((*pxInValue) >= WAIT_MAX)
                (*pxInValue) = WAIT_MAX;
              printf("%ld\tWaitValue+100;\n",*pxInValue);
              break;
            default:
              break;
          }
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%ld",*pxInValue);
          break;
          
        case XDOWN:
        case XLEFT:
          (*pxInValue) -= 100;
          switch(xValueParam)
          {
            /* Limit the values to the minimum.
             * Since enums are unsigned ints,
             *  need to check for greater than max
             *  since (0 - 1) = 4,294,967,295 */
            case TIME_VALUE:
              if ((*pxInValue) < TIME_MIN || (*pxInValue) > TIME_MAX)
                (*pxInValue) = TIME_MIN; 
              printf("%ld\tTimeValue-100;\n",*pxInValue);
              break;
            case WAIT_VALUE:
              if ((*pxInValue) < WAIT_MIN || (*pxInValue) > WAIT_MAX)
                (*pxInValue) = WAIT_MIN;
              printf("%ld\tWaitValue-100;\n",*pxInValue);
              break;
            default:
              break;
          }
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%ld",*pxInValue);
          break;
          
        case UP:
        case RIGHT:
          (*pxInValue) += 10;
          switch(xValueParam)
          {
            /* Limit the values to the upper max */
            case TIME_VALUE:
              if ((*pxInValue) >= TIME_MAX)
                (*pxInValue) = TIME_MAX;
              printf("%ld\tTimeValue+10;\n",*pxInValue);
              break;
            case WAIT_VALUE:
              if ((*pxInValue) >= WAIT_MAX)
                (*pxInValue) = WAIT_MAX;
              printf("%ld\tWaitValue+10;\n",*pxInValue);
              break;
            default:
              break;
          }
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%ld",*pxInValue);
          break;
          
        case DOWN:
        case LEFT:
          (*pxInValue) -= 10;
          switch(xValueParam)
          {
            /* Limit the values to the minimum.
             * Since enums are unsigned ints,
             *  need to check for greater than max
             *  since (0 - 1) = 4,294,967,295 */
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




portBASE_TYPE xSetGripValue(void)
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  portCHAR pcBuffer[STRING_MAX] = {0};
  portBASE_TYPE xStatus = pdFALSE;
  
  sprintf(pcBuffer,"%d",psServoValues[5]);

  printf("Grip Value\n");
  vPrintToLCD(1,"Grip Value");
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
      /* Pressing Enter or Cancel exits this function
       * Return value determines if the value has been set or not */
        case ENTER:
          return 1;
        case CANCEL:
          return 0;
          
        case XUP:
        case XRIGHT:
          psServoValues[5] += 300;

        /* Limit the values to the upper max */

          if (psServoValues[5] >= GRIP_MAX)
            psServoValues[5] = GRIP_MAX;
          printf("%d\tGripValue+300\n",psServoValues[5]);

          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",psServoValues[5]);
          break;
          
        case XDOWN:
        case XLEFT:
          psServoValues[5] -= 300;
        /* Limit the values to the minimum.
         * Since enums are unsigned ints,
         *  need to check for greater than max
         *  since (0 - 1) = 4,294,967,295 */
          if (psServoValues[5] < GRIP_MIN || psServoValues[5] > GRIP_MAX)
            psServoValues[5] = GRIP_MIN; 
          printf("%d\tGripValue-300\n",psServoValues[5]);
      
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",psServoValues[5]);
          break;
          
        case UP:
        case RIGHT:
          psServoValues[5] += 100;
            /* Limit the values to the upper max */

          if (psServoValues[5] >= GRIP_MAX)
            psServoValues[5] = GRIP_MAX;
          printf("%d\tGripValue+100\n",psServoValues[5]);

          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",psServoValues[5]);
          break;
          
        case DOWN:
        case LEFT:
          psServoValues[5] -= 100;
        /* Limit the values to the minimum.
         * Since enums are unsigned ints,
         *  need to check for greater than max
         *  since (0 - 1) = 4,294,967,295 */
          if (psServoValues[5] < GRIP_MIN || psServoValues[5] > GRIP_MAX)
            psServoValues[5] = GRIP_MIN; 
          printf("%d\tGripValue-100\n",psServoValues[5]);
  
          bzero(pcBuffer,STRING_MAX);
          sprintf(pcBuffer,"%d",psServoValues[5]);
          break;
          
        default:
          break;
      }
      vPrintToLCD(2,pcBuffer);

      bzero(pcBuffer,STRING_MAX);
      sprintf(pcBuffer,"#5 P%d T%d\r",psServoValues[5],RECORD_SPEED);
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
