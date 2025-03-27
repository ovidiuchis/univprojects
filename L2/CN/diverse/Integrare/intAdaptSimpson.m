function ret=intAdaptSimpson(f,a,b,m,tol)
	%fprintf('a=%g b=%g m=%d\n',a,b,m);
	delta=abs(intSimpson(f,a,b,m)-intSimpson(f,a,b,2*m));
	ret=0;
	if (delta<tol)
		ret=intSimpson(f,a,b,2*m);
	else
	   ret= intAdaptSimpson(f,a,(a+b)/2,m,tol)+ intAdaptSimpson(f,(a+b)/2,b,m,tol);
	end
end
