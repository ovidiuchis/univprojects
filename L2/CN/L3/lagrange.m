function [rez] = lagrange(x,fx,pct)

m = length(x);
sus = 0;
for i=1:m
       sus = sus+getAi(x,i)*fx(i)/(pct-x(i));
end;
jos = 0;
for i=1:m
    jos = jos + (getAi(x,i)/(pct-x(i)));
end;
rez = sus/jos;



