function pr3(n)
A1=zeros(n,n);
b1=zeros(n,1);

b1(n) =4;
b1(1)=4;
for i=2:n-1,
    b1(i)=3;
end
for i=1:n,
    if(i<n)
        A1(i,i+1 ) = -1;
    end
    if (i>1)
        A1(i,i-1) = -1;
    end
    for j=1:n,
        if(i==j)
            A1(i,j) = 5;
        end
    end
end
 !           
disp(A1);
disp(b1);    
x1=A1\b1;
disp(x1);
A2 = zeros(n,n);
b2 = zeros(n,1);

b2(1) = 3;
b2(n) = 3;
b2(2) =2 ;
b2(3) =2;
b2(n-2)=2;
b2(n-3)=2;

for i=3:n-3,
    b2(i)=1;
end
for i=1:n,
     if(i<n)
        A2(i,i+1 ) = -1;
    end
    if (i>1)
        A2(i,i-1) = -1;
    end
    
    if (i <n-2)
        A2(i,i+3) =-1;
    end
    if (i>3)
        A2(i,i-3) = -1;
    end
    for j=1:n,
        if(i==j)
            A2(i,j) = 5;
        end
    end
end
disp(A2);
disp(b2);
x2=A2\b2;
disp(x2);

%A1= diag(ones(n,1))*5 - diag(ones(n-1,1)1)- diag(ones(n-1,1),-1)