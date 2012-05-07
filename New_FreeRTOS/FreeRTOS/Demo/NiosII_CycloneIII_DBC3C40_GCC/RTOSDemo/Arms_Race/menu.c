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

#define NUMBER_OF_CHOICES 2
#define PLAY_TASK_STACK_SIZE (FILE_NAME_MAX * NUMBER_OF_PROGS_MAX) + 2000

extern void vWaitForReset(void);
extern void vTaskPlay( void *pvParameters );

/**
* @brief Menu Task.
*
*   This function allows the user to select which task to start:
*   Record a program or Play a program.
* 
*   On initial launch, the arm may be in an unknown state so the first
*   function called is used to reset the arm into a known position.
* 
*   Upon return to the menu task, from the record and play tasks,
*   the arm may be in an unknown position, so the reset task may
*   be called appropriately.
*
* @param [in] pvParameter Standard FreeRTOS method of passing parameters.
* @return Void.
*/
void vTaskMenu( void *pvParameters )
{
  portSHORT sReceivedValue;
  portBASE_TYPE xKeyPadQueueStatus;
  const portTickType xTicksToWait = 1000 / portTICK_RATE_MS;
  enum xChoice_t {RECORD_A_PROGRAM, PLAY_A_PROGRAM} xChoice;
  portCHAR *pcChoices[] = 
  {
    "Record a Program",
    "Play a Program"
  };
  xChoice = RECORD_A_PROGRAM;
  
  printf("Menu\n");
  if (xSystemState != MENU_SELECT)
  {
    vWaitForReset();
  }
  
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
//      printf( "Received = %d \t", sReceivedValue);
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
            case RECORD_A_PROGRAM:
              printf("%s\n",pcChoices[xChoice]);
              xSystemState = RECORDING;
              
              xTaskCreate(vTaskRecord,
                          "Record Task",
                          2000,
                          NULL,
                          1,
                          &xRecordHandle);
              /* Get out of here */
              vTaskDelete( NULL);
              break;
              
            case PLAY_A_PROGRAM:
              printf("%s\n",pcChoices[xChoice]);
              xSystemState = PLAYING;
              
              xTaskCreate(vTaskPlay,
                          "Play Task",
                          PLAY_TASK_STACK_SIZE,
                          NULL,
                          1,
                          &xPlayHandle);
              /* Get out of here */
              vTaskDelete( NULL);
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
        /* enum is an unsigned int, checking below zero doesn't work 
         * so check if value is above the max number aswell */
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
    /* Catch a problem - Do nothing */
  }
  
   vTaskDelete(NULL);
}
