function solutie = rezolvaSORIterativ(A,b, omega, eps)

	%raza spectrala a matricii(max din modulul val proprii)
	lambda=eig(A);
	rho = max(abs(lambda));
	omega_0 = 2/(1+sqrt(1-rho^2)); %nu folosim omega asta
	
	
	n=length(b);
	D=zeros(n);
	L=zeros(n);
	U=zeros(n);


	for i=1:n
		for j=1:n
			if i==j D(i,j)= A(i,j);
			end
			if i>j L(i,j)=-A(i,j);
			else L(i,j)=0;
			end
			if i<j U(i,j)=-A(i,j);
			else U(i,j)=0;
			end
		end
	end
	
	P=inv(D - omega*L);  % matrice triangulara, se poate inversa eficient
	T=P*((1-omega)*D+omega*U);
	c=omega*P*b;
	
	xnou=b;
	while true
		xvechi=xnou;
		xnou=T*xvechi+c;
		if norm(xnou-xvechi)<=((1-norm(T))/norm(T))*eps break; end
	end
	
	solutie = xnou;


	
	