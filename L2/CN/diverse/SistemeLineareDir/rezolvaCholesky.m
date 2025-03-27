function solutie = rezolvaCholesky(A, Y)
    [n, m] = size(A);
    R = A;
    
    for k=1:m
        if R(k, k)==0 
            error('matricea e singulara sau nu e hermitiana si pozitiv definita') 
        end
        
        for j=k+1:m
            R(j, j:m) = R(j, j:m) - R(k, j:m) * R(k, j)/R(k, k);
        end
        
        if R(k, k)<0 
            error('matricea nu e hermitiana si pozitiv definita')
        end
        R(k, k:m) = R(k, k:m)/sqrt(R(k, k));
    end
    R = triu(R);
    
    % rezolva sistemul transpose(R)*X1 = Y
    X1 = zeros(n, 1);
    X1(1) = Y(1)/R(1,1);
    for i=2:n
       X1(i)= (Y(i) - transpose(R(1:i-1,i))*X1(1:i-1))/R(i,i);
    end
    
    % rezolva sistemul R*X = X1
    X = zeros(n, 1);
    X(n) = X1(n)/R(n,n);
    for i=n-1:-1:1
       X(i)= (X1(i) - R(i,i+1:n)*X(i+1:n))/R(i,i);
    end
    
    
    %disp(A);
    %disp(transpose(R)*R);
    
    solutie = X;
end