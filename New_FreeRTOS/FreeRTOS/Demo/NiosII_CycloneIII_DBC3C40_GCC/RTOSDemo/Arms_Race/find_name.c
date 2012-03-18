#include <stdio.h>
#include <stdlib.h>
#include <string.h>



int main(){
  char *tester[] = {"Hello.txt", "Arf.arm", "yoyo.gargle", "sup.arm"};
  char *ptr;
  int i, j;
  
  for(i=0;i<4;i++)
  {
    if (NULL != (ptr = strstr(tester[i],".arm")))
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
