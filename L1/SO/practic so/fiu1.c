#include<unistd.h>
#include<stdlib.h>
#include<sys/fcntl.h>
#include<sys/types.h>
#include<sys/stat.h>
#include <sys/time.h>
#include <stdio.h>
#include <fcntl.h>

int my_lock(int fd,int i)
{
int n=0;
struct flock fl;
fl.l_type=F_WRLCK;
fl.l_whence=SEEK_SET;
fl.l_start=i*38;
fl.l_len=38;
n=fcntl(fd,F_SETLKW,&fl);
return n;
}

int my_unlock(int fd,int i)
{
int n=0;
struct flock fl;
fl.l_type=F_UNLCK;
fl.l_whence=SEEK_SET;
fl.l_start=i*38;
fl.l_len=38;

n=fcntl(fd,F_SETLKW,&fl);
return n;
}

int prim(int nr){
	if (!(nr%2)) return nr==2;
	int i;
	for (i=3; i*i<=nr; i+=2)
		if (!( nr%i ) ) return 0;
	return 1;
}

int get_prim(int nr){
    int i;
	for(i=nr-1;nr>=2;nr--)
		if (prim(nr)) return nr;
	return nr;
}



void fiu()
{
int fd,number,i,k,STEP,s,var=0,n;
long int nr=4097;
long int *pnr=&nr;
int *pn=&number,timp,*buff=&n;
int v[8];
struct timeval tv1,tv2;
gettimeofday(&tv1, NULL);
srand( time(NULL));

fd=open("fis.txt",O_RDWR , S_IWRITE | S_IREAD);
for(i=0;i<10;i++){
STEP=rand()%10+1;
//printf("<<<<<<<<<<<<<<<STEP=%d>>>>>>>>>>>>>>>>>>>>>>>>\n",STEP);
k=0;
while(k<10){
	var=rand()%100+1;
	if(var%STEP==0)
		{
	//	printf("***********RANDUL %d**************\n",var);
		while(my_lock(fd,var)==-1){/*printf("<<<<<<<<<<>>>>>>>>>><<<<<<<<<<<<<<<<>>>>>>>>>>>>>><<<<<<<<<<>>>>>>>>");*/};
		lseek(fd,var*38,SEEK_SET);
		number=getpid();
		write(fd,pn,2);//scriu pid-ul pe 2biti

		lseek(fd,var*38+2,SEEK_SET);
		gettimeofday(&tv2, NULL); 
  		nr=tv2.tv_usec-tv1.tv_usec;
		write(fd,pnr,4); //scriu data pe 4 biti

		lseek(fd,var*38+6,SEEK_SET);
		for(s=0;s<8;s++){
		read(fd,buff,4);
		//printf("%d\n",n);
		v[s]=2*get_prim(n);
		}
		lseek(fd,var*38+6,SEEK_SET);
		for(s=0;s<8;s++)
			{
			//pn=&v[s];
			write(fd,v+s,4); //scriu 8 numere pe cate 4 biti
			}
		my_unlock(fd,var);
		}
	k++;
	}
//printf("\n");
}
close(fd);
}



void afis(){
	int i,j,s;
	short int nr1;
	long int nr2;
	int nr3;

	int fd=open("fis.txt",O_RDONLY);
	if (fd==-1)
		{
		printf("Eroare la deschidere");
		exit(1);
		}
	for (i=0;i<100;i++){
		read(fd,&nr1,2);
		printf("procesul %d ",nr1);
		read(fd,&nr2,4);
		printf("timpul %ld\n",nr2);
		for(s=0;s<8;s++){
			read(fd,&nr3,4);
			printf("%d,",nr3);
			}
		printf("\n");
		}
	printf("\n");	
	close(fd);
}




int main()
{
int i,pid;
int pid_parinte=getpid();
printf("Fisierul inainte de procesare:\n");
afis();
for (i=0;i<3;i++)
	{
	pid=fork();
	if (pid==0){
		printf("Procesul fiu cu PID-ul: %d\n",getpid());
	    	fiu();
		break;
		}
	}
if(getpid()==pid_parinte){
wait();
wait();
wait();
printf("Fisierul dupa procesare:\n");
afis();
}
return 0;
}











