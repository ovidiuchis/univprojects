x = [1930 1940 1950 1960 1970 1980];
fx = [123230 131669 150697 179323 203212 226505];

pct = input ('Give the year: ');
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

