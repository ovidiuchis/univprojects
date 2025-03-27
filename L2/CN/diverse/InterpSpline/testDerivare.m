x = 0:0.2:10;
y = sin(x);
xi = 0:0.05:10;
ydi = derivareSpline(x,y,xi);
plot(xi, cos(xi), xi, ydi)