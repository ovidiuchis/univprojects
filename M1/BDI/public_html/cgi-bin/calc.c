#include <stdio.h>
#include <stdlib.h>
int main(void)
{
char *data;
long m,n;
char a[3], b[3] ,c[4];
char sum[4], dif[4], div[4],prod[4];

	strcpy(sum,"sum");
	strcpy(dif,"dif");
	strcpy(div,"div");
	strcpy(prod,"pro");


	printf("%s%c%c\n","Content-Type:text/html;charset=iso-8859-1",13,10);
	data = getenv("QUERY_STRING");

	if(data == NULL)
		printf("<P>Nu am primit date.");
	else
	{
		strncpy(a, data+3,2);
		strncpy(c,data+9,3); 
		strncpy(b, data+16,2);
		a[2]='\0';
		b[2]='\0';
		c[3]='\0';

		n=atol(a);
		m=atol(b);

		if (strcmp(c,div)==0)
		{
		  printf("<p> %ld / %ld = %ld ",n,m,n/m);
		}
		else if (strcmp(c,sum)==0)
			{
			  printf("<p> %ld + %ld = %ld ",n,m,n+m);
			}
			else if (strcmp(c,prod)==0)
				{
				  printf("<p> %ld * %ld = %ld ",n,m,n*m);
				}
				else if (strcmp(c,dif)==0)
					{
					  printf("<p> %ld - %ld = %ld ",n,m,n-m);
					}
			
	}
	return 0;
}
