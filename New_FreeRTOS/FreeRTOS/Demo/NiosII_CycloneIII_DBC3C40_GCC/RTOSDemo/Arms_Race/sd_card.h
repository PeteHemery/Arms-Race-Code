/****
 * Pete Hemery
 * 11/03/2012
 * 
 * sd_card.h
 ****/

#ifndef SD_CARD_H_
#define SD_CARD_H_

/*-----------------------------------
 * Prototypes *
 *-----------------------------------*/
void vTaskSDCard(void *pvParameters);
portBASE_TYPE xStartReadFileNamesTask(void);
void vEndReadFileNamesTask(void);
void vTaskReadFileNames(void *pvParameters);
void vTaskReadFileContents(void *pvParameters);
portBASE_TYPE xSendFileLines(portCHAR *pcFileName);
portSHORT psSDCardAppendFile(portCHAR *pcFileName, portCHAR *pcString, portBASE_TYPE xLen);
portSHORT sCreateFile(portCHAR *pcFileName);

/*-----------------------------------*/
#define FILE_NAME_MAX 30
#define FILE_NAME_QUEUE_LENGTH 10
#define FILE_NAME_QUEUE_SIZE (sizeof(portCHAR) *FILE_NAME_MAX)
#define FILE_NAME_STACK_SIZE 3000

extern xQueueHandle xFileNameQueue;
extern xTaskHandle xFileNameHandle;

/*-----------------------------------*/

/* Define data type that will be queued */
typedef struct Play_Settings
{
  portCHAR pcFileName[FILE_NAME_MAX];
  portSHORT psLoopCount;
} PlaySettings_TYPE;

#define PLAY_QUEUE_LENGTH 1
#define PLAY_QUEUE_SIZE sizeof(PlaySettings_TYPE)
#define PLAY_STACK_SIZE 3000

extern xQueueHandle xPlayQueue;
extern xTaskHandle xPlayHandle;

/*-----------------------------------*/
#define LOOP_MAX 100

//#define STRING_MAX 100 /* also in LCD.h */
#define STRING_QUEUE_LENGTH 1
#define STRING_QUEUE_SIZE sizeof(portCHAR * STRINGMAX)
#define STRING_STACK_SIZE 3000

extern xQueueHandle xStringQueue;
extern xTaskHandle xStringHandle;

/*-----------------------------------*/

extern portBASE_TYPE xSDConnected;

#endif /*SD_CARD_H_*/
