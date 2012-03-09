/* *
 * Pete Hemery
 * SD Card Functions
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



#include "altera_up_sd_card_avalon_interface.h"
/*
#include "system.h"
#include "sys/alt_irq.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_sys_init.h"
*/

int sd_card_main(void)
{
  alt_32 len;
  char buffer_name[10];
  short int handler;
  short int read;
  int i;
  int number_of_files = 0;
  int number_of_chars = 0;
  //t_file_record *file_record = NULL;

  int connected = 0;

  alt_up_sd_card_dev *device_reference = NULL;
  
//  ALTERA_UP_SD_CARD_AVALON_INTERFACE_INIT(SD_CARD_INTERFACE_NAME,SD_CARD_INTERFACE_NAME):
  
  
    device_reference = alt_up_sd_card_open_dev(ALTERA_UP_SD_CARD_NAME);
    if (device_reference != NULL) {
            while(1) {
                if ((connected == 0) && (alt_up_sd_card_is_Present())) {
                printf("Card connected.\n");
                if (alt_up_sd_card_is_FAT16()) {
                printf("FAT16 file system detected.\n");
                } else {
                    printf("Unknown file system.\n");
                }
                connected = 1;
                break;
            } else if ((connected == 1) && (alt_up_sd_card_is_Present() == false)) {
                printf("Card disconnected.\n");
                connected = 0;
            }
        }
    }
    else
    {
        printf("device_reference = NULL\n");
    }
    
    len  = strlen(ALTERA_UP_SD_CARD_NAME) + 1;

    handler = alt_up_sd_card_find_first("/.", buffer_name);
    printf("%d,  %s \n", handler, buffer_name);
    while ((handler = alt_up_sd_card_find_next(buffer_name)) != -1)
    {
      printf("%d,  %s \n", handler, buffer_name);
      number_of_files++;
      
      if(strcmp(buffer_name,"TEST.TXT") == 0)
      {
        handler = alt_up_sd_card_fopen("test.txt", false);
        while ((read = alt_up_sd_card_read(handler)) != -1){
          printf("%c \n", read);
          number_of_chars++;
        }
        alt_up_sd_card_fclose(handler);
      }
      else
      {
        printf("fail\n");
      }
      handler = alt_up_sd_card_fopen("test.txt", false);
      for (i=0;i<number_of_chars;i++)
      {
        if (alt_up_sd_card_write(handler, 'A'+i) == 0) printf("fail\n");
      }
      while ((read = alt_up_sd_card_read(handler)) != -1) printf("%c \n", read);
      //create_file("whoops.txt", file_record, t_file_record *home_dir);
      
      alt_up_sd_card_fclose(handler); 
    }
  return len;   
}

void vTaskSDCard(void *pvParameters)
{
  unsigned int status = 0;
  const char *pcTaskName = "SD Card\n";
  printf(pcTaskName);
  
  status = sd_card_main();
  printf("SD card status = %d\n",status);

   vTaskDelete(NULL);   
}

