/* *
 * Pete Hemery
 * LCD Display Functions
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
#include "LCD.h"

void vTaskLCD(void *pvParameters)
{
 const portTickType xTicksToWait = 50 / portTICK_RATE_MS;
 int i = 0;
 FILE *fd;
 
 fd = fopen(LCD_NAME, "w");
 fprintf(fd,"Forward/Backwards\n");
 for (;;){
  fprintf(fd,"%d\r",i++);
  
  vTaskDelay(xTicksToWait); // Chill out the for loop a bit
 }
}
