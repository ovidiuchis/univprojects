function ret=intAdaptTrapeze(f,a,b,m,tol)
	%fprintf('a=%g b=%g m=%d\n',a,b,m);
	delta=abs(intTrapeze(f,a,b,m)-intTrapeze(f,a,b,2*m));
	ret=0;
	if (delta<tol)
		ret=intTrapeze(f,a,b,2*m);
	else
	   ret= intAdaptTrapeze(f,a,(a+b)/2,m,tol)+ intAdaptTrapeze(f,(a+b)/2,b,m,tol);
	end
end
