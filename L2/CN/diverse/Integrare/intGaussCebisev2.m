function rezultat = intGaussCebisev2(f, n)
% calculeaza integrala [de la -1 la 1]( (1-x^2)^(1/2) f(x) dx )
%  n - numarul de noduri

    % construim matricea 
	v = 1/4 * ones(1, n-1);
	Jn = diag(sqrt(v), 1) + diag(sqrt(v), -1);

    [V, M] = eig(Jn);

    % nodurile sunt valorile proprii, de pe diagonala lui M -- formula (3)
    x = diag(M); 
	A = pi/2 * V(1, :) .* V(1, :); 

    rezultat = A * f(x);
end