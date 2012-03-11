/****
 * Pete Hemery
 * 11/03/2012
 * 
 * sd_card.h
 ****/

#ifndef SD_CARD_H_
#define SD_CARD_H_

void * pvSDCardInit(void);
int sd_card_read_names(void);
int sd_card_read_file(char *file_name);
void vTaskSDCard(void *pvParameters);

#endif /*SD_CARD_H_*/
