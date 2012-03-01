/*
 * Pete Hemery
 * Waypoints Functions
 * */
 
/* Standard includes. */
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* Altera specific */
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "waypoints.h"

/***
 * Create Waypoint :
 *  Malloc's a struct and adds it to the linked list
 *  control input options:
 *  Reset static variables when 'user program' is closed
 **/

struct waypoint_t * create_waypoint(int wp_num, BYTE control){
  static struct waypoint_t *tail = NULL;
  struct waypoint_t *walker;
  struct waypoint_t *wp;
  static int number_of_waypoints = 0;
  int i;

  /* New program loaded */
  switch(control){
    case RESET:
      tail = NULL;
      number_of_waypoints = 0;
      return 0;
      
    case ITEM_DELETED:
      number_of_waypoints--;
      return 0;
      
    case NONE:
    default:
      break;
  }
  
  /* Give me some memory */
  wp = (struct waypoint_t *) malloc(sizeof(struct waypoint_t));
  wp->waypoint_number = wp_num; /* Remember your number! */
  wp->flag.keypad_mode = KEYPAD_MODE;
  wp->flag.servo_set.servo_flags = (unsigned char) 0x00; /* clear the flags */
  for(i=0;i<6;i++){
    wp->servos[i].speed = 0;  /* Set speed to 0 initially */
  }
  wp->flag.time = 0;
  wp->flag.wait = 0;
  
  
  /* First waypoint set */
  if(0 == number_of_waypoints++){
    tail = wp;
    return wp;
  }
  
 /**
  * Update neighbouring items to point here
  **/
  
  /* If this is the last on the list */
  if(number_of_waypoints <= wp_num){
    wp->prev = tail;
    tail->next = wp;
    tail = wp;
  }
  else{
  /* Insert waypoint in the middle of the list */
    walker = tail;
    /* Walk backwards through the list until the item at insertion position */
    for(i=0; i < (number_of_waypoints-wp_num); i++){
      walker->waypoint_number++;    /* Update the position of following items */
      walker = walker->prev;
    }
    
    wp->prev = walker;
    wp->next = walker->next;
    if(wp_num > 1){
      walker->next = wp;
    }
  }

  return wp;
}

/****
 * Remove current waypoint from the linked list
 * Change the pointers from the next and previous items
 ****/
int kill_waypoint(struct waypoint_t * wp){
  if(wp != NULL){
    wp->prev->next = wp->next;
    wp->next->prev = wp->prev;
    free(wp);
    return 0;
  }  
  return 1;
}

int get_input(void){

  char input = 0;
  char buffer[BUFFER_SIZE];
  int i = 0;  

  bzero(buffer,BUFFER_SIZE);
  input = getchar();
  while(input != '\n'){
    buffer[i++] = input;
    input = getchar();
    
    if(i == BUFFER_SIZE){
      while(getchar() != '\n');
      buffer[BUFFER_SIZE-1] = '\0';
      input = '\n';
    }
  }
  if(strlen(buffer) == 0){
    return -1;
  }
  if(buffer[0] == 'y'){
    return buffer[0];
  }
  if(buffer[0] < '0' || buffer[0] > '9'){
    return -1;
  }
  i = atoi(buffer);
  printf("buffer: %s  number: %d\n\n",buffer,i);
  return i;
}

void set_servo_value(struct waypoint_t * wp){
  int i = 0;
  BYTE valid = 0;
  BYTE servo_number = 0;
  
  while(valid == 0){  

    while(valid == 0){
      printf("Set Servo Number (0-5)\n");
      i = get_input();
      servo_number = (BYTE)i;
      if(i >= 0 && i <= 5){ 
        valid = 1;
      }
      i = 0;
    }
    valid = 0;
      
    while(valid == 0){
      printf("Set Position (0-180)\n");
      i = get_input();
      wp->servos[servo_number].position = deg_to_arm(i);
      printf("arm output: %d\n",wp->servos[servo_number].position);
      if(i >= 0 && i <= 180){
        valid = 1;
      }
      i = 0;
    }
    valid = 0;

    while(valid == 0){
      printf("\nSet Speed? Y/N (N)\n");
      i = get_input();
      if(i == 'y'){
        while(valid == 0){
          printf("Set Speed value\n");
          i = get_input();
          wp->servos[servo_number].speed = i;
          if(i >= 0 && i <= 2500){
            valid = 1;
          }
        }
      }
      else{
        printf("Speed not set\n");
        wp->servos[servo_number].speed = 0;
        while(getchar() != '\n');
      }
      valid = 1;
      i = 0;
    }
    valid = 0;

    
    /* set flag bit to show value has changed */
    wp->flag.servo_set.servo_flags |= (unsigned char)0x01 << servo_number;

    /* Go round again? */
    printf("Set another servo position?\n");
    i = get_input();
    if(i == 'y'){
      valid = 0;
    }
    else{
      printf("Way point finished\n");
      valid = 1;
    }
  }
}
/* Print way point info */
void print_struct(struct waypoint_t * wp){
  int i;

  printf("Waypoint %d:\n",wp->waypoint_number);
  /*printf("flags %02x:\n",wp->flag.servo_set.servo_flags);*/
  printf("Servos set:\n");
  for(i=0;i<6;i++){
    if((unsigned char)((wp->flag.servo_set.servo_flags >> i) & 0x01)){
      printf("#%d P%d ",i,wp->servos[i].position);
    }
    if((wp->servos[i].speed) != 0){
      printf("S%d ",wp->servos[i].speed);
    }
  }
  printf("\n");  
}

void vTaskWayPointCreate(void *pvParameters){
  int wp_count = 0;
  int i;
  char input;
  struct waypoint_t *head = NULL;
  struct waypoint_t *tail = NULL;
  struct waypoint_t *next = NULL;

  while(input != 'x'){
    printf("Press 1 to create a way point, 'x' to exit\n");
    input = getchar();  
    if(input == '1'){
      while(getchar() != '\n');
      printf("waypoint: %d\n",++wp_count);
      tail = create_waypoint(wp_count,NONE);
      if(wp_count == 1){
        head = tail;
      }
      printf("setting servo values:\n");
      set_servo_value(tail);
      print_struct(tail);
    }
  }
  
  if(wp_count){
    for(i=0;i<wp_count;i++){
      printf("waypoint: %d freed\n",head->waypoint_number);
      next = head->next;
      free(head);
      head = next;
    }
  }
  
  vTaskDelete(NULL);
}

