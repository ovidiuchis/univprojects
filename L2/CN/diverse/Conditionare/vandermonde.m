function vandermonde_cond=vandermonde(n)

k=0:n;
t=-1+k*2/n;
v=vander(t);

%cond(v)
vandermonde_cond = cond(v,inf);