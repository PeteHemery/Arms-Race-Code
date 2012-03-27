/* *
 * Pete Hemery
 * Keypad Functions
 * */
 
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

/* Arms Race */
#include "keypad.h"

//#define DEBUG

#define THRESHOLD 20

extern int sd_card_read_names(void);
extern int sd_card_read_file(char *);

char *key_assignment[] = {
  "RESET",  "XUP", "BLANK1", "PLAY",
  "XLEFT",   "UP", "XRIGHT", "PAUSE",
  "LEFT",  "DOWN",  "RIGHT", "BLANK2",
  "STOP", "XDOWN", "CANCEL", "ENTER"
};

/**
* @brief Key Pad Task.
*
*   This function continuously polls the hardware registered checking
*   for a valid keypress. The No Key Pressed bit is bit 5, which this bit
*   is set to 0, a key has been pressed and the lower 4 bits will represent
*   the value of the button pressed.
* 
*   There is a bug, sometimes the value of the NKP bit is set
*   just before or after the register is read, the workaround is to
*   first read the value, and if its the first time the button's been pressed,
*   read again after a delay to double check the value is valid.
*
* @param [in] pvParameters Standard FreeRTOS parameters.
* @return Void.
*/
void vTaskKeyPad(void *pvParameters)
{
  static unsigned char hold = 0;
  unsigned short usKeyPadStatus = 0;
  unsigned short usPreviousKeyPadStatus = 0;
    
  portBASE_TYPE xQueueStatus;
  const portTickType xTicksToWait = 50 / portTICK_RATE_MS;
  
  
  for (;;)
  {
      vTaskDelay(xTicksToWait); // Chill out the for loop a bit
      usKeyPadStatus = IORD_ALTERA_AVALON_PIO_DATA(KEYPAD_BASE); // Read HW
      //printf("status: %d\n",usKeyPadStatus);
      
      if (usKeyPadStatus < 0x10){ //value latched
        if (usPreviousKeyPadStatus != usKeyPadStatus){
          /* Perform another read, since there's a bug
           * that the value don't get updated quick enough*/
          vTaskDelay(20 / portTICK_RATE_MS);
          usKeyPadStatus = IORD_ALTERA_AVALON_PIO_DATA(KEYPAD_BASE); // Read HW
          if (usKeyPadStatus >= 0x10)
      /* Break; causes FreeRTOS scheduler to freak out.
       * so Continue in the infinite for loop.
       */
            continue;
          hold = 0;
        }
        if(hold == 0 || hold >= THRESHOLD){
#ifdef DEBUG
          printf("%d %s\n",usKeyPadStatus, key_assignment[usKeyPadStatus]);
          printf("hold value: %d\n",hold);
#endif
          xQueueStatus = xQueueSendToBack( xKeyPadQueue, &usKeyPadStatus, xTicksToWait);
          if( xQueueStatus != pdPASS )
          {
#ifdef DEBUG
            printf( "Could not send to the queue.\r\n");
#endif
          }
          if (hold == THRESHOLD){
            hold = THRESHOLD - 3;
          }
        }
        if(++hold == 0){
          hold = THRESHOLD;
        }
      }
      else
      {
        if (usPreviousKeyPadStatus < 0x10){ //Only do something if there's a chance
          
#ifdef DEBUG
          printf("no key pressed\n");
          //printf("status: %d\n",usKeyPadStatus);
#endif
        }
        hold = 0;
      }
      usPreviousKeyPadStatus = usKeyPadStatus;
      taskYIELD();
  }
    
}

