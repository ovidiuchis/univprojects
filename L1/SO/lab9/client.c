#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include<fcntl.h>
#include<sys/types.h>
int main() {
  int f, l;
  char line[1000];

  
 
    printf("Incep\n");
    f=open("/tmp/date",O_WRONLY);
    if (!f)
	printf("Nu se poate scrie in fisier \n");
    printf("Dati numele: ");
    fgets(line, 1000, stdin);
    l = strlen(line);
    write(f, &l, sizeof(l));
    write(f, line, strlen(line));
       
    close(f);
}
