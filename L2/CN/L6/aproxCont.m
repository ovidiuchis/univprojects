function y1=aproxCont(x,y,grad)
m=length(x);%m>=grad
xn=zeros(grad+1,m);
w=1./(1-x.^2);
for i=0:grad
    xn(i+1,:)=cos(i*acos(x));
end
A=zeros(grad+1,grad+1);
b=zeros(grad+1,1);
for i=1:grad+1
    for j=1:grad+1
        A(i,j)= trapz(x,xn(i,:).*xn(j,:).*w);
    end
    b(i)=trapz(x,xn(i,:).*y.*w);
end
coef= A\b;
disp(A);
y1=xn'*coef;