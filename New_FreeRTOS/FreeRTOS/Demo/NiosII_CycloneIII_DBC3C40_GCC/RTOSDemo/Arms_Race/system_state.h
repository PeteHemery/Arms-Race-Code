#ifndef SYSTEM_STATE_H_
#define SYSTEM_STATE_H_

enum xSystemState_t
{
  WAITING_FOR_RESET,
  RESETTING,
  MENU_SELECT,
  RECORDING,
  PLAYING
};

extern enum xSystemState_t xSystemState;

void vTaskReset(void);

/* May not be needed */
extern xTaskHandle xStringHandle;
/* --- */

extern xTaskHandle xArmComHandle;
extern xTaskHandle xSDCardHandle;
extern xTaskHandle xLCDTimeOutHandle;
extern xTaskHandle xKeyPadHandle;
extern xTaskHandle xMenuHandle;
extern xTaskHandle xRecordHandle;
extern xTaskHandle xPlayHandle;

extern void vTaskArmCom(void *pvParameters);
extern void vTaskSDCard(void *pvParameters);
extern void vTaskLCDTimeOut( void * pvParameters );
extern void vTaskKeyPad(void *pvParameters);
extern void vTaskMenu( void *pvParameters );
extern void vTaskRecord( void *pvParameters );
extern void vTaskPlay( void *pvParameters );

#endif /*SYSTEM_STATE_H_*/
