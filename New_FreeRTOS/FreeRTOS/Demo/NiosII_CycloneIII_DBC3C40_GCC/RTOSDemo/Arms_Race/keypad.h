/****
 * Pete Hemery
 * 6/3/2012
 * 
 * keypad.h
 ****/
 
#ifndef KEYPAD_H_
#define KEYPAD_H_

enum {
  RESET, XUP, BLANK1, PLAY,
  XLEFT,  UP, XRIGHT, PAUSE,
  LEFT, DOWN, RIGHT,  BLANK2,
  STOP, XDOWN, CANCEL, ENTER
};

extern char *key_assignment[];

extern xQueueHandle xKeyPadQueue;

#endif /*KEYPAD_H_*/
