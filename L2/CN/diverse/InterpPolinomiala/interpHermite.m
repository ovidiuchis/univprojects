function yAprox=interpHermite(x, y, yd, xAprox)
% construieste polinomul de interpolare Hermite 
% x, y, yd - datele de interpolat (yd is derivatele lu' y(x))
% xAprox - punctele in care se evalueaza polinomul

m=length(x);
for k=1:length(xAprox)
    vx=xAprox(k);
    for i=1:m
        z(2*i-1)=x(i);
        z(2*i)=x(i);
        Q(2*i-1,1)=y(i);
        Q(2*i,1)=y(i);
        Q(2*i,2)=yd(i);
        if i~=1
            Q(2*i-1,2)=(Q(2*i-1,1)-Q(2*i-2,1))/(z(2*i-1)-z(2*i-2));
        end
    end
    for i=3:2*m
        for j=3:i
            Q(i,j)=(Q(i,j-1)-Q(i-1,j-1))/(z(i)-z(i-j+1));
        end
    end
	
    vy=Q(1,1);
    term1=vx-x(1);
    term2=(vx-x(1))^2;
    for i=1:m-1
        vy=vy+Q(2*i,2*i)*term1+Q(2*i+1,2*i+1)*term2;
        term1=term2*(vx-x(i+1));
        term2=term1*(vx-x(i+1));
    end
    vy=vy+term1*Q(2*m,2*m);
    yAprox(k)=vy;
end