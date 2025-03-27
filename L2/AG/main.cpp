#include<stdio.h>
#include<string.h>
#define N 15
#define M 100
short c[N];
int n,m;
char rez=20;
long long cate[100];
char a2[100];
void init()
{
	scanf("%d%d",&n,&m);
	int x,y;
        for(int i=0; i<m; ++i)
	{
		scanf("%d%d",&x,&y);
		--x;
		--y;
		c[x]|=(1<<y);
		c[y]|=(1<<x);
	}
	memset(a2,20,sizeof(a2));
	a2[0]=0;
	cate[0]=1;

}
void colorez(short nod,short ant2,short ptc2,short last)
{
	if(nod==n)
	{
		if(last==0)
			return;
	       	char aux=a2[ant2]+1;
		if(a2[ptc2]>aux)
		{
			a2[ptc2]=aux; 
			cate[ptc2]=cate[ant2];
		}
		else
		if(a2[ptc2]==aux)
			cate[ptc2]+=cate[ant2];
		return;
	}
	if(a2[ant2]>=rez)
		return;
	colorez(nod+1,ant2,ptc2,last);

	if((last&c[nod])==0)
		colorez(nod+1,ant2,ptc2+(1<<nod),last+(1<<nod));

        colorez(nod+1,ant2+(1<<nod),ptc2+(1<<nod),last);
}
int main()
{
	freopen("colorare.in","r",stdin);
	freopen("colorare.out","w",stdout);
        init();
	colorez(0,0,0,0);

	rez=(int)a2[(1<<n)-1];
	printf("%d %lld\n",rez);
	return 0;
}
 
