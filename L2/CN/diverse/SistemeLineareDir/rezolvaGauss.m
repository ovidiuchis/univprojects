function solutie=elimGauss(A,Y)

    [n, m] = size(Y);
    A(:,n+1:n+m) = Y;

    for i=1:n-1 
        p=i;
        aux=A(p,i);
        if aux==0 
            for k=i+1:n
                if A(k,i)~=0     
                    aux=A(k,i);
                    p=k;
                    break;
                end 
            end
        end

        if aux==0 
            error('Nu exista solutie unica');
        end 
  
        if p~=i 
            % pivotare
            temp=A(p,:);
            A(p,:)=A(i,:);
            A(i,:)=temp;
        end 
        
        for j=i+1:n
            % eliminarea propriu-zisa
            factor = A(j,i)/A(i,i);
            A(j,:)= A(j,:) - factor*A(i,:);
        end
    end
   
    if A(n,n)==0 
        error('Nu exista solutie unica');
    end
   
   X = zeros(n, m);
   X(n, :) = A(n,n+1:n+m)/A(n,n);
   
   for i=n-1 :-1:1
       X(i,:)= (A(i,n+1:n+m) - A(i,i+1:n)*X(i+1:n, :))/A(i,i);
   end
   solutie = X;
   
                
