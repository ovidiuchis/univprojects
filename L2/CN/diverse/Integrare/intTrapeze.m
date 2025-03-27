function ret=intTrapeze(f,a,b,n)
%test intTrapeze((@x)(x^2),0,1,1000)
h=(b-a)/(n-1);
ret=0;
for i=1:n-1
    ret=ret+(h/2*f(a+h*(i-1))+h/2*f(a+h*(i)));
end


    
