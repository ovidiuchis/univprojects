x = 0:10;
y = sin(x);
xi = 0:0.1:10;
m = cos(x(1));
n = cos(x(length(x)));
yi = interpSplineComplete(x,y,m,n,xi);
dxSageata = (x(length(x))-x(1))/10;
plot(x,y,'o', xi, yi, '-', [x(1), x(1)+dxSageata], [y(1), y(1)+dxSageata*m], '-r',[x(length(x)), x(length(x))-dxSageata], [y(length(x)), y(length(x))-dxSageata*n], '-r')