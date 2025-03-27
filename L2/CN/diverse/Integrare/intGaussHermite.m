function rezultat = intGaussHermite(f, n)
% calculeaza integrala [de la -Inf la +Inf]( e^(-x^2) f(x) dx )
%  n - numarul de noduri

    % construim matricea 
	v = 1/2*(1:n-1);    
	Jn = diag(sqrt(v), 1) + diag(sqrt(v), -1);
    [V, M] = eig(Jn);

    % nodurile sunt valorile proprii, de pe diagonala lui M -- formula (3)
    x = diag(M);

    % coeficientii se exprima cu ajutorul primei componente a vectorilor proprii -- formula (4)
    A = sqrt(pi) * V(1, :) .* V(1, :); 

    rezultat = A * f(x);
end