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
  int i;
  const char *pcTaskName = "LCD Task\n";

  long lReceivedValue;
  portBASE_TYPE xStatus;
  const portTickType xTicksToWait = 200 / portTICK_RATE_MS;

  char topLine[18];
  char botLine[18] = {'\0'};

  altera_avalon_lcd_16207_state state_struct;
  altera_avalon_lcd_16207_state* state_ptr;
  
  state_ptr = &state_struct;
    
  state_ptr->base = LCD_BASE;
   
  altera_avalon_lcd_16207_init(state_ptr);
   
  lcd_clear_screen(state_ptr);
  
  for (;;)
  {
    
    sprintf(botLine,"        i = %d\n",i);
    altera_avalon_lcd_16207_write(state_ptr, topLine, strlen(topLine), 0);
    altera_avalon_lcd_16207_write(state_ptr, botLine, strlen(botLine), 0);
    //lcd_write_data(state_ptr, c++);
    
    vTaskDelay(100 / portTICK_RATE_MS);
  } 
  
  lcd_clear_screen(state_ptr); 
  
  
  vTaskDelete(NULL);

}

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

/* --------------------------------------------------------------------- */

static void lcd_write_data(altera_avalon_lcd_16207_state* sp, 
  unsigned char data)
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

  IOWR_ALTERA_AVALON_LCD_16207_DATA(base, data);

  sp->address++;
}

/* --------------------------------------------------------------------- */

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

/* --------------------------------------------------------------------- */

static void lcd_scroll_up(altera_avalon_lcd_16207_state* sp)
{
  int y;

  for (y = 0 ; y < ALT_LCD_HEIGHT ; y++)
  {
    if (y < ALT_LCD_HEIGHT-1)
      memcpy(sp->line[y].data, sp->line[y+1].data, ALT_LCD_VIRTUAL_WIDTH);
    else
      memset(sp->line[y].data, ' ', ALT_LCD_VIRTUAL_WIDTH);
  }

  sp->y--;
}
