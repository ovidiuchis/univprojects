#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>

struct Lista{
	char specie[20];
	int stoc;
	int pret;
};
typedef struct {
	long mtip;        
	char specie[20];
	int nrbuc;
}Mesaj;

struct Lista P[100] = {"lalea\0",5, 7.5,"brad\0",10,120,"trandafir\0",9,8,"garoafa\0",10,5,"iris\0",1,20};     // lista de specii disponibile
int n = 5;

main(){
	  int msqid;    
	  int i;
	  int castig = 0;		
	  key_t key; 
	  Mesaj mes; // mesajul primit 
	  int ok;



	  key = 11;

	  if ((msqid = msgget(key, IPC_CREAT | 0600)) < 0) {    // creeaza coada
		perror("eroare msgget");
		exit(1);
	  }

	  
	  for(;;){
		
	  if (msgrcv(msqid, &mes, sizeof( Mesaj ), 0, IPC_NOWAIT) > 0) {       
	
	  	printf("\n Am primit comanda : %s %d \n", mes.specie,mes.nrbuc);
		
		ok = 0;
		if (strcmp(mes.specie,"stop")==0)
			if(msgctl(msqid,IPC_RMID,0)==0)			
				//break;
		for (i = 0; i < n; i++) {
			if ( (strcmp(P[i].specie,mes.specie)==0) && (P[i].stoc<mes.nrbuc ) ){  
				printf("\n Din specia ceruta mai sunt doar: %d \n",P[i].stoc);
				ok = 1;
				
			}
			else if ( (strcmp(P[i].specie,mes.specie)==0) && (P[i].stoc>=mes.nrbuc) ) {
				P[i].stoc-=mes.nrbuc;
				castig+=P[i].pret*mes.nrbuc;
				ok = 1;
				
			}
		}
		
		if (ok == 0)
			printf("\nSpecia nu este disponibila pe serverul nostru:p \n");

	 }
	 sleep(3);
		printf("\n Castig la acest moment : %d\n",castig);	
	}
	
}
