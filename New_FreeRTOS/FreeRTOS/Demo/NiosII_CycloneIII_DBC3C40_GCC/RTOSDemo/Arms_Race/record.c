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

#define NUMBER_OF_CHOICES 4

void vTaskRecord( void *pvParameters )
{
  portSHORT lReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  
  enum xChoice_t {SELECT_AXIS, SELECT_TIME, SELECT_WAIT, SELECT_EXIT} xChoice;
  portCHAR *pcChoices[] = 
  {
    "Axis values",
    "Time value",
    "Wait value",
    "Save & exit"
  };
  xChoice = SELECT_AXIS;
  
  printf("Record a Program\n");
  /* Get file name () */
  
  
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
          switch (xChoice)
          {
            case SELECT_AXIS:
              printf("%s\n",pcChoices[xChoice]);
              
              break;
            case SELECT_TIME:
              printf("%s\n",pcChoices[xChoice]);
              
              break;
            case SELECT_WAIT:
              printf("%s\n",pcChoices[xChoice]);
              
              break;
            case SELECT_EXIT:
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
      vPrintToLCD(2,pcChoices[xChoice]);
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}

void vSetAxisValue(void)
{
  portSHORT lReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  
  portSHORT psX = 1;
  portSHORT psY = 1;
  portSHORT psZ = 1;

  printf("Select Axis Value\n");
  vPrintToLCD(1,"Select Axis Value");
  /* Get file name () */

  xInverseStruct_t xInverseStruct = {psX, psY, psZ, ""};
  strcpy(xInverseStruct.pcOutput,"Hi");
  printf("psX=%d psY=%d psZ=%d pcOutput=%s\n",xInverseStruct.X,
                                                    xInverseStruct.Y,
                                                    xInverseStruct.Z,
                                                    xInverseStruct.pcOutput);  
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
          xInverseStruct.X = psX;
          xInverseStruct.Y = psY;
          xInverseStruct.Z = psZ;
          strcpy(xInverseStruct.pcOutput,"");
          vTaskCalculateInverse(&xInverseStruct);
          /*if ((xTaskCreate(vTaskCalculateInverse, "Inverse Kinematics", 2000, &xInverseStruct, 1, NULL))
            != pdPASS) printf("couldn't run inverse in\n");*/ 
            
          break;
          
        case CANCEL:
          xSystemState = MENU_SELECT;
          xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
          vTaskDelete(NULL);
          break;
          
        case XUP:
          psZ++;
          printf("%d psZ++;\n",psZ);
          break;
        case XDOWN:
          psZ--;
          printf("%d psZ--;\n",psZ);
          break;
          
        case UP:
          psY++;
          printf("%d psY++;\n",psY);
          break;
        case DOWN:
          psY--;
          printf("%d psY--;\n",psY);
          break;
          
        case XRIGHT:
        case RIGHT:
          psX++;
          printf("%d psX++;\n",psX);
          break;
          
        case XLEFT:
        case LEFT:
          psX--;
          printf("%d psX--;\n",psX);
          break;
          
        default:
          break;
      }
      printf("psX=%d psY=%d psZ=%d pcOutput=%s\n",xInverseStruct.X,
                                                    xInverseStruct.Y,
                                                    xInverseStruct.Z,
                                                    xInverseStruct.pcOutput);
    }
    else
    {
      //printf( "Could not receive from the queue.\r\n");
    }
    taskYIELD();
  }
}

