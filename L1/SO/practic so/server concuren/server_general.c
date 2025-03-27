#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>

struct Mesg
{
int pid;
char m[20000];
};

int main(void)
{

int fd_server, fd_client;          	 //descriptorul de fisier al clientului si al serverului
char s[15];           			 //aici voi retine numele fisierului fifo al clientului
struct Mesg primit,trimis;               //mesajele trimise si primite
int iesi=2;
      
mkfifo("serverfifo", S_IFIFO|0666);    	   //creez un fifo pt server
fd_server = open("serverfifo", O_RDONLY);  //si deschid fifo pt citire
do                                    
   {
   while(read(fd_server, &primit, sizeof(primit))>0){      //citesc mesajul trimis de client
	 procesare(primit.m,trimis.m);              //procesez mesajul primit si pregatesc un mesaj pt raspuns
//	 printf("primit %s \n",primit.m);
       	 iesi=strcmp(primit.m,"exit"); //aflu dak nu e comanda de inchidere a serverului
         sprintf(s, "fifo_%d", primit.pid);         //cu ajutorul pid-ul pe care l-a scris clientul aflam numele fifo-ului cu care comunicam cu clientul
         fd_client = open(s, O_WRONLY);             // deschid fisierul client pt scriere    
         write(fd_client, &trimis, sizeof(trimis)); //scriu in fifo clientului 
         close(fd_client);			    //dupa care inchid descriptorul
	}
    } while (iesi!=0); //cat timp nu am primit de la client "exit"
close(fd_server);     //inchid descriptorul serverului
unlink("serverfifo"); // sterg fifo
exit(0);
}

