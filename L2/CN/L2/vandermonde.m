 function vandermonde(n)
 v= zeros(n);
 % operator cu . pt operatii vect sau matric
 
 % sau definire vectoriala -> t = -1+2*(0:n-1)/(n-1);
% t = -1+2*(0:n-1)/(n-1);
 t = 1./(1:n);
 for i=1:n
     for j=1:n
         %t(i) = (-1)+(i-1)*(2/n-1);         
         %t(i) = 1/i;        
         v(i,j) = t(i)^(j-1);
     end
 end 
 
 fprintf('cond %g\n',cond(v,1));