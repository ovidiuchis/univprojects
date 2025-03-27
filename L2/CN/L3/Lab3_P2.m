x = [100 121 144];
fx = [10 11 12];

pct = 115;
m = length(x);
sus = 0;
for i=1:m
       sus = sus+getAi(x,i)*fx(i)/(pct-x(i));
end;
jos = 0;
for i=1:m
    jos = jos + (getAi(x,i)/(pct-x(i)));
end;
rasp = sus/jos;

fprintf('%3.7f', rasp);

