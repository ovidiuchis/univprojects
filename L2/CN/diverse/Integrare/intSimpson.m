function ret=intSimpson(f,a,b,m)
	n=2*m;
	s1=0;
	s2=0;
	h=(b-a)/n;

	for i=1:m-1
		s1=s1+f(a+h*(2*i));
	end
	for i=1:m
		s2=s2+f(a+h*(2*i-1));
	end
	s1=2*s1;
	s2=4*s2;
	ret=(h/3)*(f(a)+f(b)+s1+s2);

