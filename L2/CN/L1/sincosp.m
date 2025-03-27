%exemplu apel: [s1,c1]=sincosp(1,1e-9)
function [s,c]=sincosp(x,prec)
s=0;
c=0;
ts= x; tc=1;
while(x>2*pi)
    x=x-2*pi;
end
while(x<0)
    x=x+2*pi;
end
i=1;
while abs(ts)>prec
    s=s+ts;
    ts=ts*(-1)*x^2/(2*i*(2*i+1));
    i=i+1;
end
i=1;
while abs(tc)>prec
    c=c+tc;
    tc=tc*(-1)*x^2/((2*i-1)*2*i);
    i=i+1;
end
   