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

#define STRING_MAX 50

void vTaskLCD(void *pvParameters);
void vPrintToLCD(unsigned char ucLineNumber ,char *pcString);

extern xQueueHandle xLCDQueue;

struct LCDQueue_TYPE
{
  unsigned char ucLineNumber;
  char cString[STRING_MAX];
};

#endif /*LCD_H_*/
