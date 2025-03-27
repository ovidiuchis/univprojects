function solutie=rezolvaGaussIterativ(A,b, eps)

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

	P=inv(D-L);  % matrice triangulara, se poate inversa direct eficient
	T=P*U;
	c=P*b;
	xnou=b;

	while true
		xvechi=xnou;
		xnou=T*xvechi+c;
		if norm(xnou-xvechi)<=((1-norm(T))/norm(T))*eps break; end
	end
	
	solutie = xnou;
end
