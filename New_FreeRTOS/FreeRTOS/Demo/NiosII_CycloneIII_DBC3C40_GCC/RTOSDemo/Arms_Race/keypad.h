/****
 * Pete Hemery
 * 6/3/2012
 * 
 * keypad.h
 ****/
 
#ifndef KEYPAD_H_
#define KEYPAD_H_

extern xQueueHandle xKeyPadQueue;

#define THRESHOLD 15

extern void vTaskKeyPad(void *pvParameters);

#endif /*KEYPAD_H_*/
