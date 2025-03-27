x = 0:10;
y = sin(x);
xi = 0:0.1:10;
m = -sin(x(1));
n = -sin(x(length(x)));
yi = interpSplineDer2(x,y,m,n,xi);
plot(x,y,'o', xi, yi, '-')