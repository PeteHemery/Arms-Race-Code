/****
 * Pete Hemery
 * 13/03/2012
 * 
 * record.h
 ****/

#ifndef RECORD_H_
#define RECORD_H_

#define OUTPUT_MAX 100 
#define PROGRAM_NAME "PROG%03ld.ARM"

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

/* Cartesian Co-ordinate max and min values */
#define X_MAX 100
#define Y_MAX 100
#define Z_MAX 100

#define X_MIN 0
#define Y_MIN -100
#define Z_MIN 0

/* Grip, time and wait max and min values */
#define GRIP_MAX 2500
#define GRIP_MIN 500

#define TIME_MAX 10000
#define TIME_MIN 0

#define WAIT_MAX 10000
#define WAIT_MIN 0

/* Global prototypes */
extern void vCalculateInverse(xInverseStruct_t *pxInverseStruct);
/* Local prototypes */
void vTaskRecord( void *pvParameters );
void vSetAxisValues(void);

#endif /*RECORD_H_*/
