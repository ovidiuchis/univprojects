function yAprox = interpLagrange(x,y,xAprox)
% construieste polinomul de interpolare Lagrange 
% x, y - datele de interpolat
% xAprox - punctele in care se evalueaza polinomul

	m=length(x);

	for i=1:length(xAprox)  % se mai poate vectoriza aici, "tema" :))
		s=0;
		x1=xAprox(i);
		for k=1:m
			p1=1;
			p2=1;
			for j=1:m
				if j~=k
					p1=p1*(x1-x(j));
					p2=p2*(x(k)-x(j));
				end
			end
			aux=p1/p2;
			s=s+aux*y(k);
		end
		yAprox(i)=s;
	end
end