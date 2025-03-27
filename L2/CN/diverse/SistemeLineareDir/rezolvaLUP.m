function solutie = rezolvaLUP(A, b)
    [n, n] = size(A);
    [L, U, P] = descompuneLUP(A);

    % rezolva sistemul L*Y = P*b
    b = P*b;
    Y = zeros(n, 1);
    Y(1) = b(1)/L(1,1);
    for i=2:n
       Y(i)= (b(i) - L(i,1:i-1)*Y(1:i-1))/L(i,i);
    end
   
    % rezolva sistemul U*X = Y
    X = zeros(n, 1);
    X(n) = Y(n)/U(n,n);
    for i=n-1:-1:1
       X(i)= (Y(i) - U(i,i+1:n)*X(i+1:n))/U(i,i);
    end
    
    solutie = X;
end