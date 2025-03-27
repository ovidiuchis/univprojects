function integrala=intSimpson(x,y)
    n=length(x)-1;
    m=n/2;
    integrala=y(1)+y(n+1)
    for k=1:n-1
        integrala=integrala+2*y(2*k);   
    end
    for k=1:m
        integrala=integrala+4*y(2*k-1);
    end
    integrala=integrala*(x(n+1)-x(1))/(6*m);
    