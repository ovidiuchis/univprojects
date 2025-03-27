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
                  
void procesare(char *m,char *p);
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





void procesare(char *m,char *p){
FILE *fin3,*fin,*fin2;
char comanda[128]="ls -1 ",check[128]="file ";
char linie[1025];
char cmd[256],comanda2[20]="file ",slash[2]="/";
char raspuns[20000];
//	printf("dir primit ca parametru: %s\n",m);

//verific dak e director
strcat(check,m);
strcat(check," | grep directory"); // file <dir> |grep directory |cut -d: -f1
//printf("execut comanda %s\n",check);
linie[0]='\0';
fin3=popen(check,"r");
	fgets(linie,1024,fin3);
//printf("am primit raspuns:     %s \n",linie);
//printf("strlen(linie)= %d\n",strlen(linie));
if(strlen(linie)!=0)
{if(strstr(linie,"(No such file or directory)")!=NULL)
	{sprintf(raspuns,"%s NU EXISTA",m);}
	else{
	
	sprintf(raspuns,"Fisierele text din directorul %s sunt:\n",m);
	pclose(fin3);


	strcat(comanda,m);
//	printf("urmatoarea comanda: %s\n",comanda);
	fin=popen(comanda,"r");
	while(fgets(linie,1024,fin)!=NULL){
		//printf("%s",linie);
		strcpy(cmd,comanda2);
		strcat(cmd, m);
		strcat(cmd,slash);
		strcat(cmd,linie);
		cmd[strlen(cmd)-1]='\0';
		strcat(cmd," | grep \"[Tt]ext\" | cut -f1 -d\" \"| cut -d: -f1 | cut -d/ -f1- | awk '{print $NF}' FS=\"/\"");
//		printf("comanda:%s\n",cmd);

		fin2=popen(cmd,"r");
		while(fgets(linie,1024,fin2)!=NULL){
			strcat(raspuns,linie);
		//	printf("%s",linie);
			}
		strcat(raspuns,"\0");
		
		}

	}
 }
else
	{sprintf(raspuns,"%s nu este director\n",m);
	}

strcpy(p,raspuns);
}
