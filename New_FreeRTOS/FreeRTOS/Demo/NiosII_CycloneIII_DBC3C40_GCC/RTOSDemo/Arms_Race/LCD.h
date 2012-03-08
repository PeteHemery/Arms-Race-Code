/****
 * Pete Hemery
 * 6/3/2012
 * 
 * LCD.h
 ****/
 
#ifndef LCD_H_
#define LCD_H_

/* LCD */
#include "altera_avalon_lcd_16207_regs.h"
#include "altera_avalon_lcd_16207.h"

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


extern int altera_avalon_lcd_16207_write(altera_avalon_lcd_16207_state* sp, const char* ptr, int len, int flags);
static void lcd_clear_screen(altera_avalon_lcd_16207_state* sp);
static void lcd_write_data(altera_avalon_lcd_16207_state* sp, unsigned char data);
static void lcd_write_command(altera_avalon_lcd_16207_state* sp, unsigned char command);
static void lcd_scroll_up(altera_avalon_lcd_16207_state* sp);


extern void vTaskLCD(void *pvParameters);

#define LCD_MAX     16
#define LCD_BUFFER  18
struct LCD_t {
  char topLine[LCD_BUFFER];
  char botLine[LCD_BUFFER];
};

#endif /*LCD_H_*/
