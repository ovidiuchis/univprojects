#include "Nr_prec_marita.h"
#include<math.h>

void SetnoCif(intpm &nr,int n)
{
  nr.noCif=n;
}
void SetCif(intpm &nr,int *p)
{
  nr.Cif=p;
}
int GetnoCif(intpm nr)
{
  return nr.noCif;
}
int GetCif(intpm nr,int poz)
{
  return nr.Cif[poz];
}
void Dealoc(intpm &nr)
{
  delete []nr.Cif;
  nr.noCif=0;
}
void InitSum(intpm &s)
{
  int *i=new int (1);
  SetnoCif(s,1);
  SetCif(s,i);
  s.Cif[0]=0;
}
void Init(intpm &nr)
{
  SetnoCif(nr,0);
  SetCif(nr,0);
}
int Cmp(intpm nr1,intpm nr2)
{
  int i;
  if (GetnoCif(nr1)==GetnoCif(nr2))
    for(i=0;i<GetnoCif(nr1);i++)
      if(GetCif(nr1,i)==GetCif(nr2,i))
        continue;
      else
        return (GetCif(nr1,i)>GetCif(nr2,i)?1:0);
  else
    if (nr1.noCif>nr2.noCif)
      if (nr1.Cif[0]<0)
        return 0;
      else
        return 1;
    else
      if (nr2.noCif>nr1.noCif)
        if (nr2.Cif[0]<0)
          return 1;
        else
          return 0;
}
/*void Suma(intpm n1,intpm n2,intpm &s)
{
  int nrc1=GetnoCif(n1);
  int nrc2=GetnoCif(n2);
  int i,t=0;
  int *sum=new int [nrc1>nrc2?nrc1:nrc2];
  if (nrc1>nrc2)
  {
    int difcif=GetnoCif(n1)-GetnoCif(n2);
    for(i=GetnoCif(n2)-1;i>=0;i--)
    {
      sum[i+difcif+1]=GetCif(n1,i+difcif)+GetCif(n2,i)+t;
      t=sum[i+difcif+1]/10;
      sum[i+difcif+1]%=10;
    }
    for(i=nrc1-nrc2;i>0;i--)
    {
      sum[i]=GetCif(n1,i-1)+t;
      t=sum[i]/10;
      sum[i]%=10;
    }
    sum[0]=t;
  }
  else
  {
    int difcif=GetnoCif(n2)-GetnoCif(n1);
    for(i=GetnoCif(n1)-1;i>=0;i--)
    {
      sum[i+difcif+1]=GetCif(n1,i)+GetCif(n2,i+difcif)+t;
      t=sum[i+difcif+1]/10;
      sum[i+difcif+1]%=10;
    }
    for(i=nrc2-nrc1;i>0;i--)
    {
      sum[i]=GetCif(n2,i-1)+t;
      t=sum[i]/10;
      sum[i]%=10;
    }
      sum[0]=t;
  }
  if (sum[0]==0)
  {
    SetCif(s,sum+1);
    SetnoCif(s,nrc1>nrc2?nrc1:nrc2);
  }
  else
  {
    SetCif(s,sum);
    SetnoCif(s,nrc1>nrc2?nrc1+1:nrc2+1);
  }

}       */
void Sort (intpm *z,int nrm)
{
  int i;
  intpm aux;
  for (i=0;i<nrm-1 && GetnoCif(z[i])!=0;i++)
    for (int j=i+1;j<nrm && GetnoCif(z[i])!=0;j++)
      if (Cmp(z[j],z[i]))
      {
        aux=z[i];
        z[i]=z[j];
        z[j]=aux;
      }
}