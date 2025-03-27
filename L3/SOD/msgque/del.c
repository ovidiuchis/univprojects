#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
 
main(){
 int d,msgid;
 key_t key;
 key=11;
 if ((msgid = msgget(key, 0 )) < 0) {   
		perror("eroare msgget");
		exit(1);
	  }
 
 if (msgctl(msgid,IPC_RMID,0)<0){
		perror("eroare msgctl");
		exit(1);
	 }
}
