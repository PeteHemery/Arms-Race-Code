/* *
 * Pete Hemery
 * Queue Functions
 * */
 
/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

extern xQueueHandle xKeyPadQueue;

/* Blocking when Receiving from a Queue */
void vSenderTask( void *pvParameters )
{
  long lValueToSend;
  portBASE_TYPE xStatus;
  const portTickType xTicksToWait = 100 / portTICK_RATE_MS;


  lValueToSend = (long) pvParameters;

  for(;;)
  {
    xStatus = xQueueSendToBack( xKeyPadQueue, &lValueToSend, xTicksToWait);
    if( xStatus != pdPASS )
    {
      printf( "Could not send to the queue.\r\n");
    }
    taskYIELD();
  }
}

void vReceiverTask( void *pvParameters )
{
  long lReceivedValue;
  portBASE_TYPE xStatus;
  const portTickType xTicksToWait = 200 / portTICK_RATE_MS;

  for(;;)
  {
    if( uxQueueMessagesWaiting( xKeyPadQueue ) != 0)
    {
      printf( "Queue should have been empty!\r\n" );
    }
    xStatus = xQueueReceive( xKeyPadQueue, &lReceivedValue, xTicksToWait );
    if( xStatus == pdPASS )
    {
      printf( "Received = %d\r\n", lReceivedValue );
    }
    else
    {
      printf( "Could not receive to the queue.\r\n");
    }
    taskYIELD();
  }
}

