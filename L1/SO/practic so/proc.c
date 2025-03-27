#include<stdio.h>
#include<unistd.h>

int main()
{
 int i=0;
 if (fork()==0)
   {
   printf("Pid: %d, Pid Parinte: %d \n",getpid(),getppid());
   if (fork()==0)
      {printf("Pid: %d, Pid Parinte: %d \n",getpid(),getppid());
       exit(0);}
   wait();
   if (fork()==0)
      printf("Pid: %d, Pid Parinte: %d \n",getpid(),getppid());
   exit(0);
   }
 wait(); 
 if (fork()==0)
   {
   printf("Pid: %d, Pid Parinte: %d \n",getpid(),getppid());
   if (fork()==0)
      {printf("Pid: %d, Pid Parinte: %d \n",getpid(),getppid());
       exit(0);}
   wait();
   if (fork()==0)
      printf("Pid: %d, Pid Parinte: %d \n",getpid(),getppid());

   }

}
