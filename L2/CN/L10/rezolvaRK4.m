function [x, y] = rezolvaRK4(f, x0, y0, xmax, n)
% rezolva aproximativ ecuatia y' = f(x, y) cu conditia initiala y(x0) = y0
% solutia va fi construita pe n puncte echidistante in intervalul [x0, xmax]

h = (xmax-x0)/(n+1);

nEcuatii = length(y0);

x = zeros(1, n+1);
y = zeros(nEcuatii, n+1);

x(1) = x0;
y(:,1) = y0;

for i = 1:n
	xi = x(i);
	yi = y(:,i);
	
	K1 = h * f(xi, yi);
	K2 = h * f(xi+h/2, yi+K1/2);
	K3 = h * f(xi+h/2, yi+K2/2);
	K4 = h * f(xi, yi+K3);
	
	y(:, i+1) = yi + 1/6*(K1 + 2*K2 + 2*K3 + K4);
	x(i+1) = xi + h;
end



