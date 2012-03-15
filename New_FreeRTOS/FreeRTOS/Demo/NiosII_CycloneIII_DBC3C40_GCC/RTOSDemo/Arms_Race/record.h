/****
 * Pete Hemery
 * 13/03/2012
 * 
 * record.h
 ****/

#ifndef RECORD_H_
#define RECORD_H_

extern void vTaskCalculateInverse(void *pvParameters);

#define OUTPUT_MAX 50 

typedef struct {
  portSHORT X;
  portSHORT Y;
  portSHORT Z;
  portCHAR pcOutput[OUTPUT_MAX];
} xInverseStruct_t;


#endif /*RECORD_H_*/
