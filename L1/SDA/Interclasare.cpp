#include <stdio.h>
#include <conio.h>
#define nrElem 100
int x[nrElem],n;

void comb (int inf, int mijloc, int sup)
{int i,j,k,l;
 int y[nrElem];
 i=k=inf;
 j=mijloc+1;
 while ( i<=mijloc && j<=sup)
  if (x[i] <= x[j])  y[k++]=x[i++];
      else	     y[k++]=x[j++];
  for(l=i;   l<=mijloc; y[k++]=x[l++]);
  for(l=j;   l<=sup;    y[k++]=x[l++]);
  for(k=inf; k<=sup;    x[k++]=y[k]);
}

void di (int p, int q)
{ int m;
  if (p<q) { m=(p+q)/2;
	     di(p,m);
	     di(m+1,q);
	     comb(p,m,q);
	   }
}

void main(void)
{int i,n;
 clrscr();
 printf ("dati nr de elemente:");
 scanf  ("%d",&n);
 for (i=1; i<=n; i++)
  {printf("x[%d]=",i);
   scanf("%d",&x[i]);
  }
 di(1,n);
 printf("vectorul dupa sortare\n");
 for (i=1; i<=n; i++) printf("%5d",x[i]);
 getch();
}
