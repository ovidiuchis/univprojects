#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include<fcntl.h>
#include<sys/types.h>
int main() 
{
    int f, l;
    char line[1000], comanda[1000];
    FILE *g;
    if ((f=open("/tmp/date",O_RDONLY))<0)
        printf("Nu se poate citi din fisier \n");
    read(f, &l, sizeof(l));
    read(f, line, l);
    strcpy(comanda, "file ");
    strcat(comanda, line);
    g = popen(comanda, "r");
    fgets(line, 1000, g);
    printf("rezultat: ");
    printf("%s",line);
    close(f);
}
