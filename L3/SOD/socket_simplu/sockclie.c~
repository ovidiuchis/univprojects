clientu trimitea un nr si serveru raspundea cu suma tuturor numerelor de pana atunci

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <arpa/inet.h>


int main (int argc, char *argv[])
 {
  int sock;
  int port;
  int k;
  char comanda[2048];
  char ip[20];
  struct sockaddr_in addr;
  char buf[2048];
  char optiune[20];

  if (argc < 2) 
  {
    printf ("\nUsage: ./client ip port\n");
    return 1;
  }
  else 
  {
    strcpy(ip, argv[1]);
    sscanf(argv[2], "%d", &port);s
    printf("'a' pt a adauga anunta, 'i' pt interogare ");
    scanf("%s",optiune);
    if (strcmp(optiune,"a")==0){
	strcpy(comanda,"");
	strcpy(comanda,optiune);
	strcpy(comanda,"/");
	printf("Introduceti 'tip_produs/pret'");
	scanf("%s",optiune);
	strcpy(comanda,optiune);  
   }
   else if (strcmp(optiune,"i")==0){
	 	strcpy(comanda,"");
		strcpy(comanda,optiune);
		strcpy(comanda,"/");
		printf("Introduceti 'pret_inf/pret_sup'");
		scanf("%s",optiune);
		strcpy(comanda,optiune); 
       }
  }

  sock = socket(AF_INET, SOCK_STREAM, 0);
  if (sock < 0) 
  {
    perror ("\nCould not create socket\n");
    return 1;
  }

  addr.sin_addr.s_addr = inet_addr(ip);
  addr.sin_port = htons(port);
  addr.sin_family = AF_INET;

  if (connect (sock, (struct sockaddr *) &addr, sizeof(addr)) < 0) 
  {
    perror("\nCould not connect to host\n");
    return 1;
  }

  send(sock, comanda, strlen(comanda), 0);

  while(1) 
  {
    k = recv(sock, buf, 2084, 0);
    if(k <= 0) 
      break;
    printf("\ntotal: %s\n",buf); 	

  }

  if (close(sock) < 0)
  {
    perror("\nCould not close socket\n");
    return 1;
  }

  return 0;
}

