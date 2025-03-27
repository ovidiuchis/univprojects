
#include<stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <fcntl.h>               
struct Mesg
{
 int pid;
 char m[2000];
};
      
int main(int argc, char *argv[])          
{
  int fd_server, fd_client;               
  char s[15];
  struct Mesg primit,trimis;
      
  if (argc != 2)                         //verific dak numarul de argumente este 2
   {
     printf("Utilizare: ./client <Director>\n");
     exit(1);
   }
          
   sprintf(s, "fifo_%d", getpid());        //pun in s numele pe care il va avea fifo si anume fifo_(pidul procesului curent)
   mkfifo(s, S_IFIFO|0666);                //creez fifo
   fd_server = open("serverfifo", O_WRONLY);      //deschid pt scriere fifo: serverfifo

   trimis.pid = getpid();                       // scriu in fifo procesului server pid-ul procesului meu pt ca serverul s shtie in ce fifo sa transmita mesajul
   strcpy  ( trimis.m , argv[1] );		//pun in mesajul ce urmeaza a fi trimis numele directorului 

   write(fd_server, &trimis, sizeof(trimis));  //scriu datele ce urmeaza a fi trimise serverului
   fd_client = open(s, O_RDONLY);              //deschid fisierul fifo pt client pt citire
                                                                                        
   read(fd_client, &primit, sizeof(primit));   //citesc raspunsul
   close(fd_client);			       //inchid descriptorul de fisier al clientului
   unlink(s);                              	//sterg fifo-ul clientului
   printf("Mesajul primit este: %s\n", primit.m);
   exit(0);
}
