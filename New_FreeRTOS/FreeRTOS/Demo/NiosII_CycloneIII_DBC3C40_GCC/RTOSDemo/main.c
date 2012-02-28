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

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

/*
void vTask1(void *pvParameters);
void vTask2(void *pvParameters);
*/
/*
void vTaskLED(void *pvParameters);
void vTaskLEDControl(void *pvParameters);
*/
void vTaskKeyPad(void *pvParameters);
void vTaskSerial(void *pvParameters);
extern void vTaskLCD(void *pvParameters);
extern int serial_main(void);

/* SD Card Stuff */
//extern int sd_card_main(void);
void vTaskSDCard(void *pvParameters);

unsigned int uLED_Mask = 0x03;

int main( void )
{
// alt_u16 led = 0x4;
// IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, led);

/* xTaskCreate(vTaskLED, "task 1", 1000, (void *) 100, 1, NULL);  
 xTaskCreate(vTaskLED, "task 2", 1000, (void *) 200, 1, NULL);
 xTaskCreate(vTaskLED, "task 3", 1000, (void *) 50, 1, NULL);
*/
 //xTaskCreate(vTaskSerial, "UART", 1000, NULL, 1, NULL);
 //xTaskCreate(vTaskSDCard, "UART", 1000, NULL, 1, NULL); 

 xTaskCreate(vTaskKeyPad, "Keypad", 1000, NULL, 1, NULL);
 xTaskCreate(vTaskLCD, "LCD", 1000, NULL, 1, NULL);
 
/* 
 xTaskCreate(vTaskLED, "task 1", 1000, (void *) 100, 1, NULL);
 xTaskCreate(vTaskLED, "task 2", 1000, (void *) 200, 1, NULL);
 xTaskCreate(vTaskLED, "task 3", 1000, (void *) 50, 1, NULL);
 xTaskCreate(vTaskLEDControl, "controller task", 1000, (void *) 10, 1, NULL);


 xTaskCreate(vTask1, "task 1", 1000, NULL, 1, NULL);
 xTaskCreate(vTask2, "task 2", 1000, NULL, 1, NULL);
 */  
    /* Finally start the scheduler. */
   vTaskStartScheduler();
    printf("Scheduler Went Wrong\n");
   /* Will only reach here if there is insufficient heap available to start
   the scheduler. */
   for( ;; );
}


/*
void vTask1(void *pvParameters)
{
 const char *pcTaskName = "Task 1 is running\n";
 volatile unsigned long u1;
 
 for (;;)
 {
  printf(pcTaskName);
  for (u1=0; u1 < 40; u1++)
  {
  } 
 } 
}  
   void vTask2(void *pvParameters)
{
 const char *pcTaskName = "Task 2 is running\n";
 volatile unsigned long u1;
 
 for (;;)
 {
  printf(pcTaskName);
  for (u1=0; u1 < 100; u1++)
  {
  } 
 }     
}
*/



void vTaskKeyPad(void *pvParameters)
{
  unsigned int status = 0;
  unsigned int prev_status = 0;
  const char *pcTaskName = "Control\n";
  printf(pcTaskName);
  
  for (;;)
  {
      status = IORD_ALTERA_AVALON_PIO_DATA(KEYPAD_COUNTER_0_BASE);
      vTaskDelay(10 / portTICK_RATE_MS);
      if (status != prev_status){
        if (status < 16){
          printf("%d\n",status);
        }
        else{
          //printf("no key pressed\n");
        }
      }
      prev_status = status;
  }
    
}


/*
void vTaskLEDControl(void *pvParameters)
{
  const char *pcTaskName = "Control\n";
  printf(pcTaskName);
  printf("LED BASE %x\n",LEDS_BASE);
  
  for (;;)
  {
      IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, ~uLED_Mask);
      vTaskDelay((unsigned long)pvParameters / portTICK_RATE_MS);
  }
    
}
*/
void vTaskSerial(void *pvParameters)
{
  unsigned int status = 0;
  const char *pcTaskName = "Serial test\n";
  printf(pcTaskName);
  
  status = serial_main();
  printf("status = %d\n",status);
/*  
  for (;;)
  {
      status = IORD_ALTERA_AVALON_PIO_DATA(UART_BASE);
      vTaskDelay(200 / portTICK_RATE_MS);
      printf("%c\n",status);
  }
*/
   vTaskDelete(NULL);   
}


void vTaskLED(void *pvParameters)
{
 volatile unsigned int led = 1;
 volatile unsigned char dir = 0;
 volatile unsigned int seger = 0;
 
 seger = (1 >> (unsigned long)pvParameters) | (1 << (32 - (unsigned long)pvParameters));
 
 
 for (;;)
 {
     printf("%u\n",led);
     
     uLED_Mask ^= led; /* turn the last led back on */
     
     if (led & 0x01) 
        dir = 0x01;
    
     if (led & 0x200) 
        dir = 0x00;
            
     if (dir)
        led = led << 1; 
     else 
        led = led >> 1; 
     
     uLED_Mask ^= led; /* put out the next led */
     
     
     IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, uLED_Mask);
        
     vTaskDelay((unsigned long)pvParameters / portTICK_RATE_MS);
 }
}

/*
void vTaskSDCard(void *pvParameters)
{
  unsigned int status = 0;
  const char *pcTaskName = "SD Card\n";
  printf(pcTaskName);
  
  status = sd_card_main();
  printf("status = %d\n",status);

   vTaskDelete(NULL);   
}
*/
