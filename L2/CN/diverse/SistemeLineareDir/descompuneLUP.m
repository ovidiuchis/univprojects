function [L, U, P] = descompuneLUP(A)

    [n, n] = size(A);
    U = A;
    L = diag(ones(1, n));
    P = diag(ones(1, n));
    
    for k=1:n-1
        imax = k; umax = abs(U(k, k));
        for i = k+1:n
            if abs(U(i, k))>umax
                umax = abs(U(i, k));
                imax = i;
            end
        end
        
        if imax~=k
            % pivotare
            temp=L(k,1:k-1);
            L(k,1:k-1)=L(imax,1:k-1);
            L(imax,1:k-1)=temp;
            
            temp=U(k,k:n);
            U(k,k:n)=U(imax,k:n);
            U(imax,k:n)=temp;
            
            temp=P(k,:);
            P(k,:)=P(imax,:);
            P(imax,:)=temp;
        end 
        
        for j=k+1:n
            L(j, k) = U(j, k)/U(k, k);
            U(j, k:n) = U(j, k:n) - L(j, k) * U(k, k:n);
        end 
    end
    
    %disp(L*U);
    %disp(P*A);
end