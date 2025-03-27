#include<stdio.h>
#include<fcntl.h>
#include<stdlib.h>
#include<time.h>
#include<unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int prim(int nr)
{
 int i;
 if (nr==1 || nr==2)
  return 1;
 for (i=2;i<nr/2+1;i++)
  if (nr%i==0)
   return 0;
 return 1;
}
int pred_prim(int nr)
{
 int i;
 for (i=nr;i>=0;i--)
  if (prim(i)==1)
   return i;
 return 0;
} 
int work()
{
 int poz,i,k,p,v[8];
 FILE *f;
 short s;
 long l;
 f=fopen("date.txt","r+");
 
 printf("\n Prelucrarea lui %d \n",getpid());
 poz=rand()%100;
 printf("\n Pozitia generata este: %d \n",poz);
 for (i=0;i<100;i++)
    if (i%poz==0)
    {
     fseek(f,((sizeof(short)+8*sizeof(long)+sizeof(int))*(i-1)),SEEK_SET);
     fread(&s,sizeof(short),1,f);
     fread(&l,sizeof(long),1,f);
     fread(v,sizeof(int),8,f);
     for (k=0;k<8;k++)
      v[k]=2*pred_prim(v[k]);
     
     //Update la fisier 
     struct tm *local;
     time_t t;
     long x;
     t = time(NULL);
     local = localtime(&t);
     l=local->tm_hour*10000+local->tm_min*100+local->tm_sec;
     
     fseek(f,((sizeof(short)+8*sizeof(long)+sizeof(int))*(i-1)),SEEK_SET);
     s=getpid();
     fwrite(&s,sizeof(short),1,f);
     fwrite(&l,sizeof(long),1,f);
     for(k=0;k<8;k++)
        fwrite(&v[k],sizeof(int),1,f); 
    }
 fclose(f);
 sleep(1);
}
int main()
{
 int i,p;
 printf("\n incep prelucrarile \n");
 i=0;pid_t fo;
 while (i<=2)
 {
   fo=fork();
   if (fo==0)
        for (p=0;p<5;p++)
         work();
   else
    printf("Eroare la fork ");
   i++;
  }
 //aici ar trebui un ciclu waitpid dupa toate pid-urile.
 int k,j,v[8];
 short s;long l;
 FILE *f;
 f=fopen("date.txt","r");
 printf("\n Afisez continutul nou: \n");
 for(i=0;i<100;i++)
 {
  fread(&s,sizeof(short),1,f);
  fread(&l,sizeof(long),1,f);
  fread(v,sizeof(int),8,f);
  printf("%hi %li ",s,l);
  for (k=0;k<8;k++)
    printf(" %d ",v[k]);
  printf("\n");
 }
 fclose(f);
 return 0;
}

   



