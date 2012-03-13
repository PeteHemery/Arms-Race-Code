/* *
 * Pete Hemery
 * SD Card Functions
 * */
 
/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <ctype.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

/* PH added */
#include "altera_up_sd_card_avalon_interface.h"
#include "sd_card.h"
#include "LCD.h"

/*-----------------------------------*/

void * pvSDCardInit(void)
{
  int connected = 0;
  alt_up_sd_card_dev *device_reference = NULL;
  
  device_reference = alt_up_sd_card_open_dev(ALTERA_UP_SD_CARD_NAME);
  while(1) {
    if (device_reference != NULL) {
      if ((connected == 0) && (alt_up_sd_card_is_Present())) {
          printf("Card connected.\n");
          if (alt_up_sd_card_is_FAT16()) {
            printf("FAT16 file system detected.\n");
          }
          else {
            printf("Unknown file system.\n");
          }
          connected = 1;
          break;
      } else if ((connected == 1) && (alt_up_sd_card_is_Present() == false)) {
          printf("Card disconnected.\n");
          connected = 0;
      }
    }
    else
    {
        printf("device_reference = NULL\n");
    }
  }
  
  return device_reference;
}

/*-----------------------------------*/

int sd_card_read_names(void)
{
  int number_of_files = 0;
  char buffer_name[25];
  short int handler;
    
    handler = alt_up_sd_card_find_first("/.", buffer_name);
    printf("%d,  %s \n", handler, buffer_name);
    while ((handler = alt_up_sd_card_find_next(buffer_name)) != -1)
    {
      number_of_files++;
      printf("%d,  %s \n", handler, buffer_name);
    }
    printf("Number of files: %d\n",number_of_files);
    alt_up_sd_card_fclose(handler);
  return number_of_files;   
}

/*-----------------------------------*/

short sd_card_write_file(char *file_name, char *chars_to_write)
{
  short handler = -1;
  short i = 0;
  short sStringLength = 0;
  
  sStringLength = strlen(file_name);
  if ((handler = alt_up_sd_card_fopen(file_name, true)) != -1){
    for (i=0;i<sStringLength;i++)
    {
      if ((alt_up_sd_card_write(handler, chars_to_write[i])) != 1)
        printf("failed to write\n");
    }
    if ((alt_up_sd_card_write(handler, '\n')) != 1)
      printf("new line fail\n");
    
    /* Should set the handler to true */
    handler = alt_up_sd_card_fclose(handler);
  }
  else
  {
    printf("file already exists\n");
  }
  return handler;
}

/*-----------------------------------*/

short sd_card_append_file(char *file_name, char *chars_to_write)
{
  short handler = -1;
  short read;
  short i = 0;
  short sStringLength = 0;
  
  sStringLength = strlen(file_name);
  if (sStringLength == 0)
  {
    printf("File name = 0\n");
    return -1;
  }
  if ((handler = alt_up_sd_card_fopen(file_name, false)) != -1){
    /* Read to the end of the file */
    while ((read = alt_up_sd_card_read(handler)) != -1);
    for (i=0;i<sStringLength;i++)
    {
      if ((alt_up_sd_card_write(handler, chars_to_write[i])) != 1)
        printf("failed to write\n");
    }
    if ((alt_up_sd_card_write(handler, '\n')) != 1)
      printf("new line fail\n");
      
    /* Should set the handler to true */
    handler = alt_up_sd_card_fclose(handler);
  }
  else
  {
    printf("cannot open file\n");
  }
  return handler;
}

/*-----------------------------------*/

int sd_card_read_file(char *file_name)
{
  int number_of_chars = 0;
  short handler;
  short read;
  char cFileLine[100] = {0};
  
  if ((handler = alt_up_sd_card_fopen(file_name, false)) != -1)
  {
    printf("looking for the file %s\n",file_name);
    while ((read = alt_up_sd_card_read(handler)) != -1){
      printf("%c", read);
      cFileLine[number_of_chars] = (char)read;
      number_of_chars++;
    }
    printf("'EOF'\nnumber_of_chars = %d\n",number_of_chars);
    alt_up_sd_card_fclose(handler);
    handler = 0;
  }
  if (handler == -1)
  {
    printf("File not found\n");
  }    
    
  /*
    handler = alt_up_sd_card_find_first("/.", buffer_name);
    printf("%d,  %s \n", handler, buffer_name);
    while ((handler = alt_up_sd_card_find_next(buffer_name)) != -1){
      printf("looking for the file %s\n",file_name);
      printf("%d,  %s \n", handler, buffer_name);
      if (strcasecmp(buffer_name,file_name) == 0)
      {
        printf("found it!\n");
        handler = alt_up_sd_card_fopen(buffer_name, false);
        printf("%d attribs\n",alt_up_sd_card_get_attributes(handler));
        
        //printf("%d,  %s \n", handler, buffer_name);
        while ((read = alt_up_sd_card_read(handler)) != -1){
          printf("%d, %c \n", handler, read);
          number_of_chars++;
        }
        printf("'EOF'\nnumber_of_chars = %d\n",number_of_chars);
        alt_up_sd_card_fclose(handler);
        handler = 0;
        break;
      }
    }
    if (handler == -1)
    {
      printf("File not found\n");
    }*/
    
  return number_of_chars;   
}

void vTaskSDCard(void *pvParameters)
{
  unsigned int status = 1;
  unsigned int prev_status = 1;
  
  //printf(pcTaskName);
  status = (unsigned int)pvSDCardInit();
  printf("SD card status = %d\n",status);
  

  for(;;){
    
    if(alt_up_sd_card_is_Present() == false) {
      status = 0;
    }
    else {
      status = 1;
    }
    
    if (status != prev_status) {
      if (status == 0) {
        printf("Card disconnected.\n");
      }
      else {
        pvSDCardInit();
        sd_card_read_names();
      }
    }
    prev_status = status;
    
    taskYIELD();
  }
  vTaskDelete(NULL);   
}

/*
spare code to use one day 
*/

/*
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
        if (alt_up_sd_card_write(handler, 'a'+i) == 0) printf("fail\n");
      }
      while ((read = alt_up_sd_card_read(handler)) != -1) printf("%c \n", read);
      //create_file("whoops.txt", file_record, t_file_record *home_dir);
*/
