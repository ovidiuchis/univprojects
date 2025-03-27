%pt returnare doua valori [s1,c1]=sincos(valoare)
function [s,c]=sincos(x)
s=0;
c=0;
ts= x; tc=1;
for i=1:4
    s=s+ts;
    c=c+tc;
    ts=ts*(-1)*x^2/(2*i*(2*i+1));
    tc=tc*(-1)*x^2/((2*i-1)*2*i);
end