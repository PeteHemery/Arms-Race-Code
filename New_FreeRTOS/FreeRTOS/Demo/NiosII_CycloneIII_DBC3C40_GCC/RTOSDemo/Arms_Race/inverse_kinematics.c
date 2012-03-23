/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
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

#define EL_WR 107.94 //length between elbow and wrist.
#define SH_EL 95.25  //length between shoulder and elbo.
#define WR_END 85.725 // length between the wrist and end effector. 

float pi = 3.14159265;

float xt;
float I;
float X;
float Z;
float c;
float J2;
float theta;
float ang;
float J1;
float x1;
float Z1;
float d;
float J3;
float base;

float theta1, theta2, theta3, Base;

float servovalue[4];


void vCalculateInverse(xInverseStruct_t *pxInverseStruct)
{
  float x;
  float y;
  float z;
  float rounding;
  int i;
  portCHAR pcTestBuffer[6] = {0};
  
  x = pxInverseStruct->X;
  y = pxInverseStruct->Y;
  z = pxInverseStruct->Z;

  xt = x; //x translation
  I = sqrt((pow(x,2))+(pow(y,2))); 
  X = I;
  Z = z + WR_END;
  c = sqrt(pow(X,2)+(pow(Z,2)));
  J2 = acos((pow(EL_WR,2)+(pow(SH_EL,2))-(pow(c,2)))/(2*EL_WR*SH_EL));
  theta = acos((pow(c,2)+(pow(SH_EL,2))-(pow(EL_WR,2)))/(2*SH_EL*c));
  ang = atan(Z/X) + theta;
  J1 = atan (Z/X) + theta;
  x1 = SH_EL*cos(ang);
  Z1 = SH_EL*sin(ang);
  d = sqrt((pow((X-x1),2))+(pow((Z-WR_END-Z1),2)));
  J3 = acos((pow(EL_WR,2)+(pow(WR_END,2))-(pow(d,2)))/(2*EL_WR*WR_END));
  base = atan(y/xt);
  
  theta1 = 180 / pi * J1;
  theta2 = 180 / pi * J2;
  theta3 = 180 / pi * J3;
  Base =   180 / pi * base;
  /*
  printf("Theta 1\t%0.0f\n", roundf(theta1*10.0f)/10.0f);
  printf("Theta 2\t%0.0f\n", roundf(theta2*10.0f)/10.0f);
  printf("Theta 3\t%0.0f\n", roundf(theta3*10.0f)/10.0f);
  printf("Base\t%0.0f\n", roundf(Base*10.0f)/10.0f);
  printf("\n");
  */
  servovalue[0] = 11.11 * theta1 + 500;
  servovalue[1] = 11.11 * theta2 + 500;
  servovalue[2] = 11.11 * theta3 + 500;
  servovalue[3] = 11.11 * Base + 500;
  
  /* NaN stands for Not a Number.
   * If this is produced when printing the float, don't print it */ 
  for(i=0; i<4; i++)
  {
    rounding = roundf(servovalue[i]*10.0f)/10.0f;
    sprintf(pcTestBuffer,"%0.0f",rounding);
    if (strcmp(pcTestBuffer,"NaN") != 0)
    {
      sprintf(pcTestBuffer,"#%d P%0.0f ",i,rounding);
      strcat(pxInverseStruct->pcOutput,pcTestBuffer);
    }
  }

  //printf("OUTPUT = %s\n",pxInverseStruct->pcOutput);
  return;
}
