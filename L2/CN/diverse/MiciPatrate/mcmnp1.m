function mcmnp1(F,a,b,n)
h=(b-a)/100;
x=a:h:b;
y=F(x);
%calcul lui phi
N=length(x);
term = ones(1,N);
for i=1:n
    phi(i,:)=term;
    term=term .* x;
end
%pentru verificare
%plot(x,phi);
%construirewa ecuatiilor normale (2)
for i=1:n
    for j=1:n
        A(i,j)= phi(i,:) * transpose (phi(j,:)); %phii,phij
    end
   B(i,1)= phi(i,:)* transpose(y);
end
%disp(A);
%disp(B);
%rezolvarea spatiilor normale;coeficientii a
a= linsolve(A,B);
disp(a);
%calcul lui phi*
phi_star= zeros(1,N);
for i=1:n
       phi_star=phi_star + a(i)*phi(i,:);
end
plot(x,y,x,phi_star);
