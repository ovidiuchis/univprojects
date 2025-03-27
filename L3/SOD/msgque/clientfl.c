#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include<stdlib.h>
#include <string.h>

typedef struct {
	long mtip;      
	char specie[20];
	int nrbuc;
}Mesaj;

main(int argc, char* argv[]){
	  int msgid;     
	  key_t key;         // cheia cozii
	  Mesaj mes;         //aici preg mesaj de trimis

	  key = 11;


	  if ((msgid = msgget(key, 0 )) < 0) {   
		perror("eroare msgget");
		exit(1);
	  }
	

	 mes.mtip = 1;

	strcpy(mes.specie,argv[1]);
	mes.nrbuc=atoi(argv[2]);   
	printf("%s %d\n",mes.specie ,mes.nrbuc);
	 

	  if (msgsnd( msgid, &mes, sizeof(Mesaj),IPC_NOWAIT) < 0) {
	      perror("eroare msgsnd");
	     exit(1);
	  }
}
	 
 
 
