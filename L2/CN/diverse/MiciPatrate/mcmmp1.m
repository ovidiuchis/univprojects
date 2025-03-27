function mcmmp1(f,a,b,n)
    h=(b-a)/1000;
    x=a:h:b;
    y=f(x);
    plot(x,y);
    
    %phi
    N=length(x);
    term=ones(1,N);
    for i=1:n
        phi(i,:)=term;
        term=term.*x;
    end
    plot(x,phi);
    
    %ecuatii normale
    for i=1:n
        for j=1:n
            A(i,j)=phi(i,:)*transpose(phi(j,:));
        end
        B(i,1)=phi(i,:)*transpose(y);
    end
        
    %A*a=B
    a=linsolve(A,B);
    disp(a);
    
    %pb de rez
    phistar=zeros(1,N);
    for i=1:n
        phistar=phistar+a(i)*phi(i,:);
    end
    plot(x,y,x,phistar);
   
    w=1./sqrt(1-x.^2);
   
    %pb1
    for i=1:n
        for j=1:n
            A(i,j)=trapz(x,phi(i,:).*phi(j,:).*w);
        end
        B(i,1)=trapz(x,phi(i,:).*y.*k);
        
    end
    a=linsolve(A,B);
    disp(a);
    plot(x,y,x,phistar);
    
      
    %pb2
    for i=1:n
        a(i)=trapz(x,y.*phi(i,:))/trapz(x,phi(i,:).^2);
    end
    disp(a);
    
    %pb3
    for i=1:n
        phi(i,:)=cos((i-1) * acos(x));
    end
    plot(x,y,x,phistar);
    
    