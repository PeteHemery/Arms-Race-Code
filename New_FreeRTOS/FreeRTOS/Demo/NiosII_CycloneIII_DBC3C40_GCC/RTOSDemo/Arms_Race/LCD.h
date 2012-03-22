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
#include "altera_avalon_lcd_16207_mod.h"

void vPrintToLCD(unsigned char ucLineNumber ,char *pcString);

/* Included by Pete 15/03/2012 */
extern altera_avalon_lcd_16207_state* pxSp;

#define STRING_MAX 100

#endif /*LCD_H_*/
