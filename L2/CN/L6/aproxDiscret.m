function y1=aproxDiscret(x,y,grad)
m=length(x);%m>=grad
xn=zeros(grad+1,m);
for i=0:grad
    xn(i+1,:)=x.^i;
end
A=zeros(grad+1,grad+1);
b=zeros(grad+1,1);
for i=1:grad+1
    for j=1:grad+1
        A(i,j)= xn(i,:)*xn(j,:)';
    end
    b(i)=xn(i,:)*y';
end
coef= A\b;
y1=xn'*coef;