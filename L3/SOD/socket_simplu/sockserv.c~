#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <signal.h>
#include <arpa/inet.h>

struct thrarg 
{
  int sock;
  int index;
};

int rvSock;
pthread_t* thr[100];
pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mtx2 = PTHREAD_MUTEX_INITIALIZER;

struct Anunt {
       char tip[50];
       int pret;
}
struct Lista{
       Anunt anunturi[20];
       int nr_anunturi;
} 
Lista ads;	
void handler(int sig) 
{
  if (close (rvSock) < 0) 
  {
    perror("\nCould not close socket\n");
    return;
  }
}

int findFreeThread() 
{
  int i;

  pthread_mutex_lock(&mtx);
  for(i=0; i<100; i++)
    if(thr[i] == NULL)
    {
      pthread_mutex_unlock(&mtx);
      return i;
    }
  
  pthread_mutex_unlock(&mtx);

  return -1;
}

void serve(struct thrarg* arg) 
{
  int k,j,val_inf,val_sup;
  int tmp;
  char buf[2048];
  char* pts;
 
  k = recv(arg->sock, buf, 2048, 0);

  if(k > 0)
  {
    buf[k] = 0;
    if (strcmp(buf[0],"a")==0)
	    printf("SERVER: Received: Anunt\n",);
    else if (strcmp(buf[0],"i")==0)
	    rintf("SERVER: Received: Interogare\n",); 

  }

  pthread_mutex_lock(&mtx2);

  

  //aici trimit raspuns   
  /*sprintf(buf,"%d",sum);
  send(arg->sock, buf, strlen(buf), 0);*/
  pts=strtok(buf,"/");
  if (strcmp(pts,"a")==0){
    pts=strtok(NULL,"/");
    Lista.anunturi[Lista.nr_anunturi].tip=pts;
    pts=strtok(NULL,"/");    
    Lista.anunturi[Lista.nr_anunturi].pret=atoi(pts);
    strcpy(buf,"");
    strcpy(buf,"Adaugat");
    send(arg->sock, buf, strlen(buf), 0);
    }
  else if(strcmp(pts,"i")==0){
		pts=strtok(NULL,"/");
  		val_inf=atoi(pts);
		pts=strtok(NULL,"/");
		val_sup=atoi(pts);
		strcpy(buf,"");
		for (j=0;j<Lista.nr_anunturi;j++){
  			if (Lista.anunturi[j].pret>val_inf && Lista.anunturi[i].pret<val_sup){
				strcpy(buf,Lista.anunturi[j].tip);
				strcpy(buf,"\n");
				}
			}
		}
		if (strlen(buf)==0)
			strcpy(buf,"Nici un anunt\n");
		 send(arg->sock, buf, strlen(buf), 0);
	}

  pthread_mutex_unlock(&mtx2);

  pthread_mutex_lock(&mtx);
  free(thr[arg->index]);
  thr[arg->index] = NULL;
  close(arg->sock);
  free(arg);
  pthread_mutex_unlock(&mtx);
}


int main(int argc, char *argv[])
{
  int sock;
  int port;
  unsigned int len;
  int i;
  int k;
  struct sockaddr_in addr,addr2;
  ads.nr_anunturi=0;

  if (argc < 2)
  {
    printf ("\nUsage: ./server port\n");
    return 0;
  }
  else
    sscanf(argv[1], "%d", &port);

  rvSock = socket(AF_INET, SOCK_STREAM, 0);
  if (rvSock < 0)
  {
    perror("\nCould not make a socket\n");
    return 1;
  }

  addr.sin_addr.s_addr = htonl(INADDR_ANY);
  addr.sin_port = htons (port);
  addr.sin_family = AF_INET;

  if (bind (rvSock, (struct sockaddr *) &addr, sizeof (addr)) !=0 )
  {
    perror("\nCould not bind socket\n");
    return 1;
  }

  if (listen(rvSock, 5) != 0)
  {
    perror ("\nCould not listen\n");
    return 1;
  }

  for(i=0; i<100; i++)
    thr[i] = NULL;

  signal(SIGINT, handler);

  while(1)
  {
    sock = accept (rvSock, (struct sockaddr *)&addr2,  &len);

    if(sock < 0)
      break;
    printf("SERVER: Connection from %s:%d\n", inet_ntoa(addr.sin_addr), ntohs(addr.sin_port));

    k = findFreeThread();
    if(k < 0)
    {
      close(sock);
      continue;
    }

    struct thrarg* ta = (struct thrarg*)malloc(sizeof(struct thrarg));
    ta->sock = sock;
    ta->index = k;
    thr[i] = (pthread_t*)malloc(sizeof(pthread_t));

    pthread_create(thr[i], NULL, (void *(*)(void*))serve, ta);
  }

  for(i=0; i<100; i++)
  {
    pthread_t* t = thr[i];
    if(t != NULL)
      pthread_join(*t, NULL);
  }

  return 0;
}

