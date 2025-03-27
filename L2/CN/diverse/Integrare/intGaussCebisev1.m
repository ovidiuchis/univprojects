function rezultat = intGaussCebisev1(f, n)
% calculeaza integrala [de la -1 la 1]( (1-x^2)^(-1/2) f(x) dx )
%  n - numarul de noduri

    % aici avem direct coeficientii si nodurile 
    x = cos(pi/n*([1:n]' - 1/2));
	A = pi/n*ones(1, n);

    rezultat = A * f(x);
end