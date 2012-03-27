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

/**
* @brief Print to the LCD screen.
*
*   This function accepts two parameters, line number and
*   string. These are used to determine where to print
*   the incoming screen on the LCD display.
* 
*   Alternatively, 0 can be used to clear the LCD display.
*
* @param [in] ucLineNumber value of either 1 or 2, 
*             indicating which line of the LCD to print to.
* @param [in] pcString ASCII string, containing text to print.
* @return Void.
*/
void vPrintToLCD(unsigned portCHAR ucLineNumber, portCHAR *pcString)
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
    case 0:
    default:
      sprintf(pcBuffer,"\n\n\n");      
      altera_avalon_lcd_16207_write(pxSp, pcBuffer, strlen(pcBuffer), 0);
      break;
  }
}
