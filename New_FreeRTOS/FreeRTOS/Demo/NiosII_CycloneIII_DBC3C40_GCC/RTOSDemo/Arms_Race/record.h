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
  portBASE_TYPE xServosSet;
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
    SELECT_SERVOS,
    SELECT_AXIS,
    SELECT_GRIPPER, 
    SELECT_TIME, 
    SELECT_WAIT, 
    SET_WAYPOINT, 
    SELECT_EXIT
  } xChoice_t;
  
typedef enum {
    SELECT_BASE,
    SELECT_SHOULDER,
    SELECT_ELBOW,
    SELECT_WRIST,
    SERVO_EXIT
  } xServoChoice_t;

/* Cartesian Co-ordinate max and min values */
#define X_MAX 4
#define Y_MAX 14
#define Z_MAX 100

#define X_MIN -4
#define Y_MIN 1
#define Z_MIN 0


#define SERVO_MAX 2500
#define SERVO_MIN 500

/* Grip, time and wait max and min values */
#define GRIP_MAX 2300
#define GRIP_MIN 1000

#define TIME_MAX 10000
#define TIME_MIN 0

#define WAIT_MAX 10000
#define WAIT_MIN 0

/* Global prototypes */
extern int vCalculateInverse(xInverseStruct_t *pxInverseStruct);
/* Local prototypes */
void vTaskRecord( void *pvParameters );

portBASE_TYPE vSelectServos(void);
void xSetServoValue(portSHORT);
portBASE_TYPE xSetAxisValue(xInverseStruct_t *pxInverseStruct);
portBASE_TYPE xSetAValue(xSetValueParam xValueParam, portBASE_TYPE *pxInValueIn);
portBASE_TYPE xSetGripValue(void);

#endif /*RECORD_H_*/
