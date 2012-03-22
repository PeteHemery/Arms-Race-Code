/*
alt_ic_isr_register(

static void __interrupt __far vKeypadInterruptHandler( void )
{
  static portBASE_TYPE xHigherPriorityTaskWoken;

  xHigherPriorityTaskWoken = pdFALSE;
  
 *//* 'Give' the semaphore to unlock the task. *//*
  xSemaphoreGiveFromISR( xBinarySemaphore, &xHigherPriorityTaskWoken );
  printf("here\n");
  
  if ( xHigherPriorityTaskWoken == pdTRUE )
  {
    portSWITCH_CONTEXT();
  }  
}
*/



/*main*/

  /* Before a semphore is used it must be explicitly created. */
//  vSemaphoreCreateBinary( xBinarySemaphore );
  
  /* Install the interrupt handler */
//  _dos_setvect( KEYPAD_WITH_IRQ_0_IRQ, vKeypadInterruptHandler);
  
  /* Check the semaphore was created successfully */
//  if( xBinarySemaphore != NULL)
//  {
