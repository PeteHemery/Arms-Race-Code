/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <math.h>

#include "altera_avalon_lcd_16207_mod.h"
/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

#include "record.h"

/* Johns Variables */
/* Arm dimensions( mm ) */
#define BASE_HGT 67.31      //base hight 2.65"
#define HUMERUS 146.05      //shoulder-to-elbow "bone" 5.75"
#define ARMLENGTH 187.325        //elbow-to-wrist "bone" 7.375"
#define GRIPPER 100.00          //gripper (incl.heavy duty wrist rotatemechanism) length 3.94"

#define pi 3.14159265

extern portSHORT psServoValues[6];

float X, Y, Z;

// orientation of the gripper
float gripper_angle = 0;//1 * (180.0/pi); 

float servovalue[4];

/**
* @brief Calculate Inverse Kinematic Values.
*
*   This function calculates the servo values required
*   to send to the Lynx arm, given the struct containing
*   X, Y and Z cartesian co-ordinates.  
*
* @param [in] pxInverseStruct Pointer to struct containing X, Y & Z
*             values, and the string for output.
* @return Void.
*/

int vCalculateInverse(xInverseStruct_t *pxInverseStruct)
{
  //input for z and x,y plane

  float rounding;
  int i;
  portCHAR pcTestBuffer[20] = {0};
  
  X = pxInverseStruct->X;
  Y = pxInverseStruct->Y;
  Z = pxInverseStruct->Z;


// angle of the base running from -X to +X, the rotation of Z plane
float base_angle = atan2(Y, X);  
// the radial distance from 0 0 0 to X Y 0, i e. from center out. 
float radialdist = sqrt((X*X) + (Y*Y));

//solving RZ function the orientation of the wrist 
//solving r
float radial1 = radialdist - (sin(gripper_angle) * GRIPPER);
//solving z
float Z1 = Z - BASE_HGT + (cos(gripper_angle) * GRIPPER);
// now the RZ function is calculated the elbow angle can now be solved
// by the following. 
 float H = (sqrt((Z1 * Z1) * (radial1 * radial1))/2);
// H beeing the hypotenuse 
float elbo_angle = (asin(H/ARMLENGTH) * 2);

// now the elbo angle is known the shoulder angle can be calculated 
// using the following calculations. 
// float Z2 = atan2(Z1,radial1);
//float Zelbo = ((pi - elbo_angle)/2);

 float shoulder_angle = atan2(Z1,radial1) + ((pi - elbo_angle)/2);
//float shoulder = shoulder_angle / 2; 
// the wrist angle can then be calculated assuming the other 
// angles summed. 

float wrist_angle = pi + gripper_angle - elbo_angle - shoulder_angle;

 float B = base_angle * 180 / pi;
 float S = shoulder_angle * 180 / pi;
 float E = elbo_angle * 180 / pi;
 float W = wrist_angle * 180 / pi;


/*
// angle of the base running from -X to +X, the rotation of Z plane
float base_angle = atan2(Y, X);  
// the radial distance from 0 0 0 to X Y 0, i e. from center out. 
float radialdist = sqrt((X*X) + (Y*Y));

//solving RZ function the orientation of the wrist 
//solving r
float radial1 = radialdist - (sin(gripper_angle) * GRIPPER);
//solving z
float Z1 = Z - BASE_HGT + (cos(gripper_angle) * GRIPPER);
// now the RZ function is calculated the elbow angle can now be solved
// by the following. 
float H = (sqrt((Z1 * Z1) * (radial1 * radial1))/2.0);
// H being the hypotenuse 
float elbo_angle = (asin(H/ARMLENGTH) * 2.0);

// now the elbo angle is known the shoulder angle can be calculated 
// using the following calculations. 
// float Z2 = atan2(Z1,radial1);
//float Zelbo = ((pi - elbo_angle)/2);

 float shoulder_angle = atan2(Z1,radial1) + ((M_PI - elbo_angle)/2.0);
//float shoulder = shoulder_angle / 2; 
// the wrist angle can then be calculated assuming the other 
// angles summed. 

float wrist_angle = M_PI + gripper_angle - elbo_angle - shoulder_angle;

 float B = base_angle * (180.0 / M_PI);
 float S = shoulder_angle * (180.0 / M_PI);
 float E = elbo_angle * (180.0 / M_PI);
 //float E = -(180.0 - elbo_angle) * (180.0 / M_PI);
 float W = wrist_angle * (180.0 / M_PI);
 
 */

  servovalue[0] = 1500.0 - ((B) * 11.11);
  servovalue[1] = 1500.0 + ((S - 90.0) * 6.6);
  servovalue[2] = 1500.0 - ((E - 90.0) * 6.6);
  servovalue[3] = 1500.0 + ((W) * 11.11);
  
  
  int valid_set = 0, valid_clear = 0;

  /* NaN stands for Not a Number.
   * If this is produced when printing the float, don't print it */ 
  for(i=0; i<4; i++)
  {
    rounding = roundf(servovalue[i]*10.0f)/10.0f;
    sprintf(pcTestBuffer,"%0.0f",rounding);
    if (strcmp(pcTestBuffer,"nan") != 0 && rounding > 0 && rounding <= 2500)
    {
      sprintf(pcTestBuffer,"#%d P%0.0f ",i,rounding);
      strcat(pxInverseStruct->pcOutput,pcTestBuffer);
      
      valid_set = 1;
    }
    else
    {
      valid_clear = 1;
    }
  }
  
  if (valid_set && valid_clear == 0)
  {
    printf("Valid_set:  ");
    for(i=0; i<4; i++)
    {
      sprintf(pcTestBuffer,"%0.0f",servovalue[i]);
      psServoValues[i] = atoi(pcTestBuffer);
      printf("S%d %d\n",i, psServoValues[i]);
    }
  
    printf ("base = %f shoulder = %f elbo = %f wrist = %f\n", B, S, E, W);
    printf ("H %f\n", H);
    
    
    return 1;
  }
  printf("Invalid Output detected!\n");
  

  //printf("OUTPUT = %s\n",pxInverseStruct->pcOutput);
  return 0;
}
