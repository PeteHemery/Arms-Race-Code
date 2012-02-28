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

/* LCD */
#include "altera_avalon_lcd_16207_regs.h"
#include "altera_avalon_lcd_16207.h"

extern int altera_avalon_lcd_16207_write(altera_avalon_lcd_16207_state* sp, const char* ptr, int len, int flags);
static void lcd_clear_screen(altera_avalon_lcd_16207_state* sp);
static void lcd_write_data(altera_avalon_lcd_16207_state* sp, unsigned char data);
static void lcd_write_command(altera_avalon_lcd_16207_state* sp, unsigned char command);
static void lcd_scroll_up(altera_avalon_lcd_16207_state* sp);

void vTaskLCD(void *pvParameters);
/* --------------------------------------------------------------------- */

/* Commands which can be written to the COMMAND register */

enum /* Write to character RAM */
{
  LCD_CMD_WRITE_DATA    = 0x80
  /* Bits 6:0 hold character RAM address */
};

enum /* Write to character generator RAM */
{
  LCD_CMD_WRITE_CGR     = 0x40
  /* Bits 5:0 hold character generator RAM address */
};

enum /* Function Set command */
{
  LCD_CMD_FUNCTION_SET  = 0x20,
  LCD_CMD_8BIT          = 0x10,
  LCD_CMD_TWO_LINE      = 0x08,
  LCD_CMD_BIGFONT       = 0x04
};

enum /* Shift command */
{
  LCD_CMD_SHIFT         = 0x10,
  LCD_CMD_SHIFT_DISPLAY = 0x08,
  LCD_CMD_SHIFT_RIGHT   = 0x04
};

enum /* On/Off command */
{
  LCD_CMD_ONOFF         = 0x08,
  LCD_CMD_ENABLE_DISP   = 0x04,
  LCD_CMD_ENABLE_CURSOR = 0x02,
  LCD_CMD_ENABLE_BLINK  = 0x01
};

enum /* Entry Mode command */
{
  LCD_CMD_MODES         = 0x04,
  LCD_CMD_MODE_INC      = 0x02,
  LCD_CMD_MODE_SHIFT    = 0x01
};

enum /* Home command */
{
  LCD_CMD_HOME          = 0x02
};

enum /* Clear command */
{
  LCD_CMD_CLEAR         = 0x01
};


void vTaskLCD(void *pvParameters)
{
 int i;
 const char *pcTaskName = "Test\nArms Race\n";
 volatile unsigned long u1;
 
 altera_avalon_lcd_16207_state state_pointer;
 altera_avalon_lcd_16207_state* sp;
 
 sp = &state_pointer;
 
 alt_u16 c = 0x0;
 
 
 sp->base = LCD_BASE;
  
  altera_avalon_lcd_16207_init(sp);
 // vTaskDelay(1 / portTICK_RATE_MS);
 // lcd_clear_screen(sp);


 
 c = 0x40; 

  lcd_clear_screen(sp);
 for (i = 0; i < 240;i++)
 {
  //printf("%x ",c);
  if ((i % 13) == 0){
    altera_avalon_lcd_16207_write(sp, "\n", 1, 0);
  }
  altera_avalon_lcd_16207_write(sp, (char)c++, 1, 0);
  //lcd_write_data(sp, c++);
  
  vTaskDelay(100 / portTICK_RATE_MS);
  
  for (u1=0; u1 < 3000; u1++)
  {
  } 
 } 
  lcd_clear_screen(sp); 
  
     
  altera_avalon_lcd_16207_write(sp, pcTaskName, 15, 0); 
  vTaskDelay(2000 / portTICK_RATE_MS);   

  altera_avalon_lcd_16207_write(sp, "Well Hello\nAgain\n", 17, 0);  
  
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
