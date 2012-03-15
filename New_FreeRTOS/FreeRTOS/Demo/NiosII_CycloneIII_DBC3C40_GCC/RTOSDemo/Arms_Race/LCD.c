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

#include "altera_avalon_lcd_16207_mod.h"
#include "altera_avalon_lcd_16207.h"





/* --------------------------------------------------------------------- */


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


enum /* Clear command */
{
  LCD_CMD_CLEAR         = 0x01
};


/* --------------------------------------------------------------------- */

static void lcd_write_command(altera_avalon_lcd_16207_state* sp, 
  unsigned char command)
{
  unsigned int base = sp->base;

  /* We impose a timeout on the driver in case the LCD panel isn't connected.
   * The first time we call this function the timeout is approx 25ms 
   * (assuming 5 cycles per loop and a 200MHz clock).  Obviously systems
   * with slower clocks, or debug builds, or slower memory will take longer.
   */
  int i = 1000000;

  /* Don't bother if the LCD panel didn't work before */
  if (sp->broken)
    return;

  /* Wait until LCD isn't busy. */
  while (IORD_ALTERA_AVALON_LCD_16207_STATUS(base) & ALTERA_AVALON_LCD_16207_STATUS_BUSY_MSK)
    if (--i == 0)
    {
      sp->broken = 1;
      return;
    }

  /* Despite what it says in the datasheet, the LCD isn't ready to accept
   * a write immediately after it returns BUSY=0.  Wait for 100us more.
   */
  usleep(100);

  IOWR_ALTERA_AVALON_LCD_16207_COMMAND(base, command);
}
static void lcd_clear_screen(altera_avalon_lcd_16207_state* sp)
{
  int y;

  lcd_write_command(sp, LCD_CMD_CLEAR);

  sp->x = 0;
  sp->y = 0;
  sp->address = 0;

  for (y = 0 ; y < ALT_LCD_HEIGHT ; y++)
  {
    memset(sp->line[y].data, ' ', sizeof(sp->line[0].data));
    memset(sp->line[y].visible, ' ', sizeof(sp->line[0].visible));
    sp->line[y].width = 0;
  }
}
void vTaskLCD(void *pvParameters)
{
  const portTickType xTicksToWait = 100 / portTICK_RATE_MS;
  portBASE_TYPE xStatus;
  LCDQueue_TYPE xLCDQueueItem;
  /* New LCD doesn't work the same as old =( *//*
  lcd_clear_screen(pxSp);
  altera_avalon_lcd_16207_write(pxSp,"TESTER");
*/
  for (;;){
    if( uxQueueMessagesWaiting( xLCDQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xStatus = xQueueReceive( xLCDQueue, &xLCDQueueItem, xTicksToWait );
    if( xStatus == pdPASS )
    {
      printf( "LCD Received = %d %s\r\n", xLCDQueueItem.ucLineNumber,xLCDQueueItem.cString );
      vPrintToLCD(xLCDQueueItem.ucLineNumber,xLCDQueueItem.cString);
    }
    else
    {
      //printf( "Could not receive to the queue.\r\n");
    }
    
    taskYIELD();
  }
}
