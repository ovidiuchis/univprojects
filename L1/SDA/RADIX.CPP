	  // sortare crescatoare prin metoda Radix
#include<iostream.h>
#include<iomanip.h>
#include<conio.h>
#include<math.h>
#include<string.h>

#define DIM 100



void ScrieSir(int n, int* Y)
{ int i;

  for (i=1; i<=n; i++)
	{cout<<setw(6)<<Y[i];
	}
}

void CitesteDate(int& n, int* X)
{ int i,cod;
  n=DIM+1;
  while  ( n>DIM || n<0 )
	{ cout <<"Dati marimea vectorului n = ";
	  cin>>n;
	};

  for (i=1; i<=n; i++)
	 {cout <<"X["<<i<<"]=";
	  cin  >>X[i];
	 }
}

void radixSort (int n, int* X)
{ int i,ii,j,poz,temp,cifra,lenMax,lenCurr,divide;
  int cifMax,cifCurr;
  lenMax=0;
  cifMax=0;
  for(i=1; i<=n; i++)				// determina cifra maxima
    { lenCurr=0;				// si lungimea maxima a unui numar
      temp=X[i];
      while(temp) { cifCurr=temp %10;
		    if (cifCurr>cifMax) cifMax=cifCurr;
		    temp/=10;
		    lenCurr++;
		  }
      if (lenCurr>lenMax) lenMax=lenCurr;
    }
  cout<<"\n cifra maxima="<<cifMax<<"\n";
  cout<<"\n nr maxim de cifre="<<lenMax<<"\n";

  for (j=1;j<=lenMax; j++)
   { poz=1;
     cout<<"\n\n             dupa ordinul: "<<j;//<<"\n";
     for (cifra=0; cifra<=cifMax; cifra++)
      { divide= (int) pow(10,j-1); //cout <<"\n impartitorul="<<divide<<"\n";
	for (i=1; i<=n; i++)
	if ( (X[i] / divide ) % 10 == cifra)
	      {temp  =X[i];
	       ii=i;
	       while (ii>=poz)  X[ii--]=X[ii-1];
	       X[poz++]  =temp;
	      }
	 cout<<"\nsirul dupa cifra:"<<cifra<<"\n";
	 ScrieSir(n,X);
	 getch();
      }
    }
}

void main (void)
{ int X[DIM+1],n;
  clrscr();
  CitesteDate(n,X);
  clrscr();
  cout <<"\n    sirul inainte de...\n";
  ScrieSir(n,X);
  getch();
  radixSort(n,X);
  cout <<"\n\n   dupa sortare... \n";
  ScrieSir(n,X);
  getch();
}

