/*#include <stdio.h>
#include <string.h>
#include <altera_up_sd_card_avalon_interface.h>
*//*
#include "altera_up_sd_card_avalon_interface.h"
*//*
#include "system.h"
#include "sys/alt_irq.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_sys_init.h"


int sd_card_main(void)
{
  alt_32 len;
    char buffer_name[10];
    short int handler;
    short int read;
  

  alt_up_sd_card_dev *device_reference = NULL;
  int connected = 0;
  
    device_reference = alt_up_sd_card_open_dev(SD_CARD_INTERFACE_NAME);
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
    
    len  = strlen(SD_CARD_INTERFACE_NAME) + 1;
    */  
/*
    handler = alt_up_sd_card_find_first("HELLO/.", buffer_name);
    printf("%d,  %s \n", handler, buffer_name);
    while ((handler = alt_up_sd_card_find_next(buffer_name)) != -1) printf("%d,  %s \n", handler, buffer_name);

    handler = alt_up_sd_card_fopen("HELLO/HELLO", false);
    while ((read = alt_up_sd_card_read(handler)) != -1) printf("%c \n", read);
    alt_up_sd_card_fclose(handler);

    handler = alt_up_sd_card_fopen("FILE", false);
    while ((read = alt_up_sd_card_read(handler)) != -1) printf("%c \n", read);
    alt_up_sd_card_fclose(handler);
  */
/*  handler = alt_up_sd_card_find_first("/.", buffer_name);
    printf("%d,  %s \n", handler, buffer_name);
    while ((handler = alt_up_sd_card_find_next(buffer_name)) != -1) printf("%d,  %s \n", handler, buffer_name);
     handler = alt_up_sd_card_fopen("hello.txt", false);
    while ((read = alt_up_sd_card_read(handler)) != -1) printf("%c \n", read);
    alt_up_sd_card_fclose(handler); 
*/ /*
  return len;   
}
*/
/*
#include <stdio.h>
#include <altera_up_sd_card_avalon_interface.h>

int sd_card_main(void) {
  alt_up_sd_card_dev *device_reference = NULL;
  int connected = 0;
  
  device_reference = alt_up_sd_card_open_dev(SD_CARD_INTERFACE_NAME);
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
  return 0;
}
*/

void vTaskSDCard(void *pvParameters)
{
  unsigned int status = 0;
  const char *pcTaskName = "SD Card\n";
  printf(pcTaskName);
  
  status = sd_card_main();
  printf("SD card status = %d\n",status);

   vTaskDelete(NULL);   
}

