x = 0:10;
y = sin(x);
xi = 0:0.1:10;
yi = interpSplineBoor(x,y,xi);
plot(x,y,'o', xi, yi, '-')