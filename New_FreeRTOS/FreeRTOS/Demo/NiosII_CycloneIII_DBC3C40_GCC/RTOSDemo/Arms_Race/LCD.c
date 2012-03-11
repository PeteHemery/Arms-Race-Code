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

void vPrintToLCD(unsigned char ucLineNumber ,char *pcString)
{
  FILE *fp;
  static char cFirstLine[STRING_MAX] = {0};
  
  fp = fopen(LCD_NAME, "w");

  switch(ucLineNumber){
    case 1:
      strcpy(cFirstLine,pcString);
      fprintf(fp,"\n\n\n%s\n \r",pcString);
      break;
    case 2:
      fprintf(fp,"\n%s",cFirstLine);
      fprintf(fp,"\n%s",pcString);
      break;
    case 3:
      if ((char)pcString == '\n') {
        fprintf(fp,"\n");
      }
      else {
        fprintf(fp,"%s",(char)pcString);
      }
    case 0:
    default:
      fprintf(fp,"\n\n\n");
      break;
  }
  fclose(fp);
}


void vTaskLCD(void *pvParameters)
{
  const portTickType xTicksToWait = 100 / portTICK_RATE_MS;
  portBASE_TYPE xStatus;
  struct LCDQueue_TYPE xLCDQueueItem;
  
  for (;;){
    if( uxQueueMessagesWaiting( xLCDQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xStatus = xQueueReceive( xLCDQueue, &xLCDQueueItem, xTicksToWait );
    if( xStatus == pdPASS )
    {
      printf( "Received = %d %s\r\n", xLCDQueueItem.ucLineNumber,xLCDQueueItem.cString );
      vPrintToLCD(xLCDQueueItem.ucLineNumber,xLCDQueueItem.cString);
    }
    else
    {
      //printf( "Could not receive to the queue.\r\n");
    }
    //vTaskDelay(xTicksToWait); // Chill out the for loop a bit
    taskYIELD();
  }
}
