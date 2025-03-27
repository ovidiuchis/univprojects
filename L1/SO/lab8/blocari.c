#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>

int main()
{
 FILE *dest;
 int r,i,k;
 short y=0; 
 long x=0;
 dest=fopen("date.txt","w");
 for(i=0;i<100;i++)
  {
    fwrite(&y,sizeof(short),1,dest);
    fwrite(&x,sizeof(long),1,dest);
    for (k=0;k<8;k++) 
     {
      r=rand()%10; 
      fwrite(&r,sizeof(int),1,dest);
     } 
  }
 fclose(dest);
 dest=fopen("date.txt","r"); 
 short p=1;long xx=1;int rr[8];
 printf("s-a creat fisierul cu continutul(random) :\n");
 for(y=0;y<100;y++)
  {
    fread(&p,sizeof(short),1,dest);
    fread(&xx,sizeof(long),1,dest);
    fread(rr,sizeof(int),8,dest);
    printf("%hi %li ",p,xx);
    for (i=0;i<8;i++)
     printf(" %d ",rr[i]);
    printf("\n");
  }
 fclose(dest);
}
