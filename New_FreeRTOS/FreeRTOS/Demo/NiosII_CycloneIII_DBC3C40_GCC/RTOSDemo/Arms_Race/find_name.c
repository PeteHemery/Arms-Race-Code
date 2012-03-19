#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/*#include <strings.h>*/



int main(){
  char *tester[] = {"DEMO1.ARM", "Arf.ARm", "PROG001.ARMOUR", "..ARM"};
  char *ptr;
  int i, j;
  
  for(i=0;i<4;i++)
  {
    if (NULL != (ptr = strstr(tester[i],".ARM")))
    {
      for(j=0;j<(ptr-tester[i]);j++)
      {
        printf("%c",tester[i][j]);
      }
      printf("\n");
    }
  }
  return 0;
}
