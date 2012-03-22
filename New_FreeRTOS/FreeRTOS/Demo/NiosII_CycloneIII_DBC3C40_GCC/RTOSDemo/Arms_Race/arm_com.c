/* *
 * Pete Hemery
 * UART Functions
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

/* UART */
#include "altera_avalon_uart_regs.h"
#include "altera_avalon_uart.h"

#include "arm_com.h"

int serial_main(void)
{
    FILE* fp;
    char* msg = "hello world";
    int i = 0;
        
    fp = fopen ("/dev/uart", "w+");
    if (fp!=NULL)
    {
        
        fprintf(fp, "#0 P500\r");
        printf("#0 P500\r");
            vTaskDelay(1000 / portTICK_RATE_MS);
        fprintf(fp, "#1 P1500 #2 P1500 T2000\r");
        printf("#1 p1500 #2 p1500 T2000\r");
            vTaskDelay(1000 / portTICK_RATE_MS);
        fprintf(fp, "#3 P500 #4 P1000 T2000\r");
        printf("#3 p500 #4 p1000 T2000\r");
            vTaskDelay(1000 / portTICK_RATE_MS);
        fprintf(fp, "#0 P1500 #1 P1400 #2 P2000 #3 P1000 #4 P2000 #5 P500 T2500\r");
        printf("#0 p1500 #1 p1400 #2 p2000 #3 p1000 #4 p2000 #5 p500 T2500\r");
            vTaskDelay(1000 / portTICK_RATE_MS);
        /*for (;;)
        {
            fprintf(fp, "%d - %s\n",i++,msg);
            vTaskDelay(200 / portTICK_RATE_MS);
        }*/
    }
    else
        return 1;
    fclose (fp);
    return 0;
}

void vTaskArmCom(void *pvParameters)
{
  portBASE_TYPE xStatus = 0;
  
  xStatus = serial_main();
  printf("status = %ld\n",xStatus);
  for (;;)
  {
    /* Do nothing */
  }
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

