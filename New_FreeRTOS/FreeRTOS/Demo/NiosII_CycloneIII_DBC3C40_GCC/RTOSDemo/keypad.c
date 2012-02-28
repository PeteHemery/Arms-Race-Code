void vTaskKeyPad(void *pvParameters)
{
  int i;
  unsigned int status = 0;
  unsigned int prev_status = 0;
  unsigned int press = 0;
  unsigned int press_debounce[5] = {0};
  unsigned int prev_press = 0;
  const char *pcTaskName = "Control\n";
  printf(pcTaskName);
  
  for (;;)
  {
      vTaskDelay(50 / portTICK_RATE_MS); // Chill out the for loop a bit
      status = IORD_ALTERA_AVALON_PIO_DATA(KEYPAD_COUNTER_0_BASE); // Read HW
      
      if (status != prev_status){ //Only do something if there's a chance
        if (status & 0x20){ // NKP bit (No Key Pressed)
          press = 0;
          printf("no key pressed\n");
        }
        if (status & 0x10){ // pulse bit set - value latched
          press = status & 0x0F;
          printf("%d\n",press);
        }
      }
      prev_status = status;
  }
    
}

