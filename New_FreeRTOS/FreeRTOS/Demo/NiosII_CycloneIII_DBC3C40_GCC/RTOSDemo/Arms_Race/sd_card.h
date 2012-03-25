/****
 * Pete Hemery
 * 11/03/2012
 * 
 * sd_card.h
 ****/

#ifndef SD_CARD_H_
#define SD_CARD_H_

/*-----------------------------------*/
/* Limit the number of programs */
#define NUMBER_OF_PROGS_MAX 1000
#define FILE_NAME_MAX 30
#define LOOP_MAX 100
#define LOOP_MIN 1
/*-----------------------------------*/

/* Define data type that will be queued */
typedef struct Play_Settings
{
  portCHAR pcFileName[FILE_NAME_MAX];
  portBASE_TYPE xLoopCount;
  portBASE_TYPE xFinished;
} PlaySettings_TYPE;

/*-----------------------------------*/
#define STRING_QUEUE_LENGTH 1
#define STRING_QUEUE_SIZE sizeof(portCHAR * STRINGMAX)
#define STRING_STACK_SIZE 3000

extern xQueueHandle xStringQueue;
extern xTaskHandle xStringHandle;

/*-----------------------------------*/

extern portBASE_TYPE xSDConnected;

/*-----------------------------------
 * Local Prototypes 
 *-----------------------------------*/
void vTaskSDCard(void *pvParameters);
portBASE_TYPE xGetFileNames(portCHAR pcFileNameList[NUMBER_OF_PROGS_MAX][FILE_NAME_MAX]);
void vTaskReadFileContents(void *pvParameters);
portBASE_TYPE xGetFileLines(portCHAR *pcFileName);
portSHORT psSDCardAppendFile(portCHAR *pcFileName, portCHAR *pcString, portBASE_TYPE xLen);
portSHORT sCreateFile(portCHAR *pcFileName);

#endif /*SD_CARD_H_*/
