x = 0:0.5:10;

fx = (1 + cos(pi.*x)) ./ (1+x);

y = 0:0.01:10;
rez = zeros(1,length(y));
for i=1:length(y)
    rez(i) = lagrange(x,fx,y(i));
end;

x = 0:0.01:10;
fx = (1 + cos(pi.*x)) ./ (1+x);

hold on;
plot(y,rez);
plot(x,fx,'r');
    
    