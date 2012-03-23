/****
 * Pete Hemery
 * 21/3/2012
 * 
 * arm_com.h
 ****/
 
#ifndef ARM_COM_H_
#define ARM_COM_H_

#define STRING_MAX 100

typedef enum {
  WAITING_NOW,
  STOP_NOW,
  PLAY_NOW,
  PAUSE_NOW
} ArmControlFlag_t;

extern xQueueHandle xArmComQueue;

extern ArmControlFlag_t ArmControlFlag;

#endif /*ARM_COM_H_*/
