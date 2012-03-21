/****
 * Pete Hemery
 * 21/3/2012
 * 
 * arm_com.h
 ****/
 
#ifndef ARM_COM_H_
#define ARM_COM_H_

#define STRING_MAX 100

extern xQueueHandle xArmComQueue;

typedef struct 
{
  char cString[STRING_MAX];
} ArmComQueue_TYPE;

enum ArmControlFlag_t{
    STOP_NOW,
    PLAY_NOW,
    PAUSE_NOW,
    RESUME_NOW,
    FINISHED_NOW
};

typedef struct 
{
  enum ArmControlFlag_t ArmControlFlag;  
} ArmControlQueue_TYPE;



#endif /*ARM_COM_H_*/
