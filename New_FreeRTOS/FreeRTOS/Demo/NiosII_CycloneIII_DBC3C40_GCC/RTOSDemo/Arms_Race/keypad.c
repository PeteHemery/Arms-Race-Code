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
#define DEBUG 1

extern int sd_card_read_names(void);
extern int sd_card_read_file(char *);

char *key_assignment[] = {
  "RESET", "XUP", "BLANK1", "PLAY",
  "XLEFT",  "UP", "XRIGHT", "PAUSE",
  "LEFT", "DOWN", "RIGHT",  "BLANK2",
  "STOP", "XDOWN", "CANCEL", "ENTER"
};

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
      //printf("status: %d\n",status);
      
      if (usKeyPadStatus < 0x10){ //value latched
        if (usPreviousKeyPadStatus != usKeyPadStatus){
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
#endif
        }
        hold = 0;
      }
      usPreviousKeyPadStatus = usKeyPadStatus;
      taskYIELD();
  }
    
}

