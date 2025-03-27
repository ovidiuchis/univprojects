#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main() {

  int p[2], r[2], l;
  char line[1000], comanda[1000];
  FILE *f; 

  pipe(p);
  pipe(r);  

  if (fork()) { // parinte = client

    printf("Dati grupul: ");
    fgets(line, 1000, stdin);
    close(p[0]);
    l = strlen(line);
    write(p[1], &l, sizeof(l));
    write(p[1], line, strlen(line));
    close(r[1]);
    do {

      l = read(r[0], line, 1);
      line[1] = 0;
      printf("%s", line);  

    }
    while (l > 0); 

  }
  else { // fiu = server

    close(p[1]);
    read(p[0], &l, sizeof(l));
    read(p[0], line, l);
    strcpy(comanda, "./l2.sh ");
    strcat(comanda, line);
    close(r[0]);
    f = popen(comanda, "r");
    while (!feof(f)) {

      fgets(line, 1000, f);
      write(r[1], line, strlen(line));

    } 

  }  
}
