x=0:0.5:10;
y=sin(15*x/pi);
xi=0:0.05:10;

yi=interpLagrange(x,y,xi);

subplot(1,2,1);
plot(x,y,'o',xi,yi,'-');
title('Lagrange');


yi=interpSplineNaturale(x,y,xi);

subplot(1,2,2);
plot(x,y,'o',xi,yi,'-');
title('Spline');

