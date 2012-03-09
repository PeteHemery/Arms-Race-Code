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

xQueueHandle xKeyPadQueue;


void vTaskKeyPad(void *pvParameters)
{
  static unsigned char hold = 0;
  unsigned int status = 0;
  unsigned int prev_status = 0;
  unsigned int press = 0;
  const char *pcTaskName = "Control\n";
  printf(pcTaskName);
  
  for (;;)
  {
      vTaskDelay(50 / portTICK_RATE_MS); // Chill out the for loop a bit
      status = IORD_ALTERA_AVALON_PIO_DATA(KEYPAD_0_BASE); // Read HW
      
      //printf("status: %02x\n",status);
      //if (status != prev_status){ //Only do something if there's a chance
        
      if ((status >> 5) == 1){ // NKP set (No Key Pressed)
        if (status != prev_status){ //Only do something if there's a chance
          printf("no key pressed\n");
          hold = 0;
        }
      }
      if ((status >> 4) == 0){ // pulse bit set - value latched
        if(hold == 0 || hold >= THRESHOLD){
          press = status & 0x0F;
          printf("%d\n",press);
          
        }
        if(++hold == 0){
          hold = THRESHOLD;
        }
      }
      prev_status = status;
  }
    
}
