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

void vTaskKeyPad(void *pvParameters)
{
  unsigned int status = 0;
  unsigned int prev_status = 0;
  unsigned int press = 0;
  const char *pcTaskName = "Control\n";
  printf(pcTaskName);
  
  for (;;)
  {
      vTaskDelay(50 / portTICK_RATE_MS); // Chill out the for loop a bit
      status = IORD_ALTERA_AVALON_PIO_DATA(KEYPAD_WITH_IRQ_0_BASE); // Read HW
      
      if (status != prev_status){ //Only do something if there's a chance
        if (status & 0x20){ // NKP bit (No Key Pressed)
          press = 0;
          printf("no key pressed\n");
        }
        if (status & 0x10){ // pulse bit set - value latched
          press = status & 0x0F;
          printf("%d\n",press);
        }
      }
      prev_status = status;
  }
    
}

