x=0:0.5:10;
y=sin(x);
xi=0:0.05:10;
yd=cos(x); % cik sin'(x)=cos(x) :-??
yi=interpHermite(x,y,yd,xi);
plot(x,y,'o',xi,yi,'-');