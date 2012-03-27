/*
    FreeRTOS V6.0.1 - Copyright (C) 2009 Real Time Engineers Ltd.

    ***************************************************************************
    *                                                                         *
    * If you are:                                                             *
    *                                                                         *
    *    + New to FreeRTOS,                                                   *
    *    + Wanting to learn FreeRTOS or multitasking in general quickly       *
    *    + Looking for basic training,                                        *
    *    + Wanting to improve your FreeRTOS skills and productivity           *
    *                                                                         *
    * then take a look at the FreeRTOS eBook                                  *
    *                                                                         *
    *        "Using the FreeRTOS Real Time Kernel - a Practical Guide"        *
    *                  http://www.FreeRTOS.org/Documentation                  *
    *                                                                         *
    * A pdf reference manual is also available.  Both are usually delivered   *
    * to your inbox within 20 minutes to two hours when purchased between 8am *
    * and 8pm GMT (although please allow up to 24 hours in case of            *
    * exceptional circumstances).  Thank you for your support!                *
    *                                                                         *
    ***************************************************************************

    This file is part of the FreeRTOS distribution.

    FreeRTOS is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License (version 2) as published by the
    Free Software Foundation AND MODIFIED BY the FreeRTOS exception.
    ***NOTE*** The exception to the GPL is included to allow you to distribute
    a combined work that includes FreeRTOS without being obliged to provide the
    source code for proprietary components outside of the FreeRTOS kernel.
    FreeRTOS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
    more details. You should have received a copy of the GNU General Public 
    License and the FreeRTOS license exception along with FreeRTOS; if not it 
    can be viewed here: http://www.freertos.org/a00114.html and also obtained 
    by writing to Richard Barry, contact details for whom are available on the
    FreeRTOS WEB site.

    1 tab == 4 spaces!

    http://www.FreeRTOS.org - Documentation, latest information, license and
    contact details.

    http://www.SafeRTOS.com - A version that is certified for use in safety
    critical systems.

    http://www.OpenRTOS.com - Commercial support, development, porting,
    licensing and training services.
*/

/*******************************************************************
 * This example has been heavily modified from the original to model the 
 * examples in the RTOS manual 
 * NJG 02/12/09 */

/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "altera_avalon_lcd_16207_mod.h"
/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

/* Pete written */
#include "system_state.h"
#include "keypad.h"
#include "LCD.h"
#include "sd_card.h"
#include "arm_com.h"

/* Communication queue handles */
xQueueHandle xKeyPadQueue;
xQueueHandle xArmComQueue;

/* Task handles */
xTaskHandle xArmComHandle = NULL;
xTaskHandle xSDCardHandle = NULL;
xTaskHandle xLCDTimeOutHandle = NULL;
xTaskHandle xKeyPadHandle = NULL;
xTaskHandle xMenuHandle = NULL;
xTaskHandle xRecordHandle = NULL;
xTaskHandle xPlayHandle = NULL;

/* Variable indicating the system state */
enum xSystemState_t xSystemState = WAITING_FOR_RESET;


/**
* @brief Main.
*
*   This function calls all the tasks that start on system boot,
*   sets up the communication queues and starts the scheduler.
*   Afterwards, it should never return, only when there is a problem
*   with the scheduler. 
*
* @param [in] .
* @return Void.
*/
int main( void )
{
  xKeyPadQueue = xQueueCreate( 1, sizeof(unsigned portSHORT));
  xArmComQueue = xQueueCreate( 1, sizeof(portCHAR) * STRING_MAX);
  
  
  /* Upon resetting, reinitialise everything */
    
  if (xKeyPadQueue != NULL && xArmComQueue != NULL)
  {
    for (;;)
    {
      xTaskCreate(vTaskArmCom, "ARM COM", 1000, NULL, 1, &xArmComHandle);
      xTaskCreate(vTaskSDCard, "SD Card", 1000, NULL, 1, &xSDCardHandle); 
      xTaskCreate(vTaskLCDTimeOut, "LCD Timer", 1000, NULL, 1, &xLCDTimeOutHandle);
      xTaskCreate(vTaskKeyPad, "Keypad", 1000, NULL, 1, &xKeyPadHandle);
      
      xTaskCreate(vTaskMenu, "Menu", 2000, NULL, 1, &xMenuHandle);
        
      /* Finally start the scheduler. */
      vTaskStartScheduler();
      printf("Resetting System\n");
      
      /* Test of the FreeRTOS functions in heap_2.c */
      
      //size_t test;
      //test = xPortGetFreeHeapSize();
      //printf("Free Heap Size = %d\n",test);
    }
  }
  else
  {
    printf("Queues could not be created\n");
  }
}


