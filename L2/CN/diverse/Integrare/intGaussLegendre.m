function rezultat = intGaussLegendre(f, n)
% calculeaza integrala din f de la -1 la 1, n - numarul de noduri

    % construim matricea 
    k = 1:n-1;
    v = (4 - k .^ (-2)) .^(-1);
	Jn = diag(sqrt(v), 1) + diag(sqrt(v), -1);

    [V, M] = eig(Jn);

    % nodurile sunt valorile proprii, de pe diagonala lui M -- formula (3)
    x = diag(M); 

    % coeficientii se exprima cu ajutorul primei componente a vectorilor proprii -- formula (4)
    A = 2* V(1, :) .* V(1, :); 


    rezultat = A * f(x);
end