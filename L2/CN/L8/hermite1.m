function yi=hermite1(x,y,yd,xi)
m=length(x)-1;
for i=0:m
    z(2*i+1)=x(i+1);
    z(2*i+2)=x(i+1);
    z(2*i+1)=x(i+1);
    q(2*i+2,2)=yd(i+1);
    q(2*i+2,1)=y(i+1);
    if i~=0
        q(2*i+1,2)=(q(2*i+1,1)-q(2*i,1))/(z(2*i+1)-z(2*i))
    end
end
for i=2:2*m+1
    for j=2:i
        q(i+1,j+1)=(q(i+1,j)-q(i,j))/(z(i+1)-z(i-j+1));
    end
end

poly=ones(1,length(xi));
yi=q(1,1)*poly;

for i=1:m
    poly=poly.*(xi-x(i));
    yi=yi+q(2*i,2*i)*poly;
    poly=poly .*(xi-x(i));
    yi=yi+q(2*i+1,2*i+1)*poly;
end
poly = poly.*(xi-x(m+1));
yi=yi+q(2*m+2,2*m+2)*poly;  