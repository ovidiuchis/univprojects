x = 0:0.2:10;
y = sin(x);
xi = 0:0.05:10;
ydi = integrareSpline(x,y,xi);
plot(xi, -cos(xi)+cos(x(1)), xi, ydi)