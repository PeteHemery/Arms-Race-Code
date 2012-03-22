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

extern int altera_avalon_lcd_16207_write(altera_avalon_lcd_16207_state* sp, const char* ptr, int len, int flags);
extern altera_avalon_lcd_16207_state* pxSp;
/* --------------------------------------------------------------------- */

void vPrintToLCD(unsigned char ucLineNumber ,char *pcString)
{
  static char pcFirstLine[STRING_MAX] = {0};
  char pcBuffer[STRING_MAX] = {0};
 
  switch(ucLineNumber){
    case 1:
      strcpy(pcFirstLine,pcString);
      sprintf(pcBuffer,"\n\n\n%s\n \r",pcString);      
      altera_avalon_lcd_16207_write(pxSp, pcBuffer, strlen(pcBuffer), 0);
      break;
    case 2:
      sprintf(pcBuffer,"\n%s\n%s",pcFirstLine,pcString);      
      altera_avalon_lcd_16207_write(pxSp, pcBuffer, strlen(pcBuffer), 0);
      break;
    /*case 3:
      if ((char)pcString == '\n') {
        lcd_write_data(pxSp,"\n");
      }
      else {
        lcd_write_data(pxSp,"%c",(char)pcString);
      }*/
    case 0:
    default:
      sprintf(pcBuffer,"\n\n\n");      
      altera_avalon_lcd_16207_write(pxSp, pcBuffer, strlen(pcBuffer), 0);
      break;
  }
}
