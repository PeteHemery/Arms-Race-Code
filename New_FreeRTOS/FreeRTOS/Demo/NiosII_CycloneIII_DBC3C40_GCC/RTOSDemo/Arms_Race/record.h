/****
 * Pete Hemery
 * 13/03/2012
 * 
 * record.h
 ****/

#ifndef RECORD_H_
#define RECORD_H_

extern void vCalculateInverse(void *pvParameters);
void vTaskRecord( void *pvParameters );
void vSetAxisValues(void);

#define OUTPUT_MAX 100 

typedef struct {
  portSHORT X;
  portSHORT Y;
  portSHORT Z;
  portCHAR pcOutput[OUTPUT_MAX];
} xInverseStruct_t;

typedef struct {
  portBASE_TYPE xAxisSet;
  portBASE_TYPE xGripSet;
  portBASE_TYPE xTimeSet;
  portBASE_TYPE xWaitSet;
} xWayPoint_t;

typedef enum {
  GRIP_VALUE,
  TIME_VALUE,
  WAIT_VALUE
} xSetValueParam;

typedef enum {
    SELECT_AXIS,
    SELECT_GRIPPER, 
    SELECT_TIME, 
    SELECT_WAIT, 
    SET_WAYPOINT, 
    SELECT_EXIT
  } xChoice_t;

#define X_MAX 15
#define Y_MAX 15
#define Z_MAX 15

#define GRIP_MAX 2500
#define GRIP_MIN 500

#define TIME_MAX 10000
#define TIME_MIN 0

#define WAIT_MAX 10000
#define WAIT_MIN 0

#endif /*RECORD_H_*/
