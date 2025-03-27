function x=rezolvaJacobi(A,b)
%rezolva A*x=b;

D=diag(diag(A));
N=-(A-D);
T=inv(D)*N;
c=inv(D)*b;

x1 = c;
x2 = T * x1 +c;
while ( norm(x2-x1)>(1-norm(T))/norm(T)*1e-5 )
    x1=x2;
    x2 = T*x1+c;
    
end

x= x2 ;