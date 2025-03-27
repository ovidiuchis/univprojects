function mcmnp3(F,a,b,n)
h=(b-a)/100;
x=a:h:b;
y=F(x);
%calcul lui phi Cebisev
N=length(x);
for i=1:n
    phi(i,:)=cos((i-1)*acos(x));
end
%pentru verificare
%plot(x,phi);
%construirewa ecuatiilor normale (2)
for i=1:n
    for j=1:n
        A(i,j)=trapz(x,phi(i,:).*phi(j,:));
    end
   B(i,1)= trapz(x,phi(i,:).*y);
end
%rezolvarea spatiilor normale;coeficientii a
a= linsolve(A,B);
disp(a);
%calcul lui phi*
phi_star= zeros(1,N);
for i=1:n
       phi_star=phi_star + a(i)*phi(i,:);
end
plot(x,y,x,phi_star);