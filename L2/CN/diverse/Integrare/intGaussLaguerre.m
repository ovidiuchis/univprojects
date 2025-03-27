function rezultat = intGaussLaguerre(f, alpha, n)
% calculeaza integrala [de la 0 la +Inf](x^alpha e^(-x) f(x) dx )
%  n - numarul de noduri

    % construim matricea 
    k = 1:n-1;
	v = k .* (k+alpha);
	
	k = 0:n-1;
    d = 2*k + alpha + 1;
	
	Jn = diag(d) + diag(sqrt(v), 1) + diag(sqrt(v), -1);

    [V, M] = eig(Jn);

    % nodurile sunt valorile proprii, de pe diagonala lui M -- formula (3)
    x = diag(M); 

    % coeficientii se exprima cu ajutorul primei componente a vectorilor proprii -- formula (4)
    A = gamma(alpha+1)* V(1, :) .* V(1, :); 


    rezultat = A * f(x);
end