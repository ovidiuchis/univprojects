function rezultat = intGaussJacobi(f, valpha, vbeta, n)
% calculeaza integrala [de la -1 la 1]( (1-x)^valpha  (1+x)^vbeta f(x) dx )
%  n - numarul de noduri
	k=1:n-1;
	beta0 = 2^(valpha+vbeta+1) * beta(valpha+1,vbeta+1);
	v=[4*k.*(k+valpha).*(k+valpha+vbeta).*	(k+vbeta)./((2*k+valpha+vbeta-1) .* (2*k+valpha+vbeta).^2 .* (2*k+valpha+vbeta+1))];
	

	if valpha==vbeta
		d=zeros(1,n);
	else
		k=0:n-1;
		d=(vbeta^2-valpha^2)./(2*k+valpha+vbeta)./(2*k+valpha+vbeta+2);
	end

    % construim matricea 
	Jn = diag(d) + diag(sqrt(v), 1) + diag(sqrt(v), -1);

    [V, M] = eig(Jn);

    % nodurile sunt valorile proprii, de pe diagonala lui M -- formula (3)
    x = diag(M);

    % coeficientii se exprima cu ajutorul primei componente a vectorilor proprii -- formula (4)
    A = beta0* V(1, :) .* V(1, :); 

    rezultat = A * f(x);
end