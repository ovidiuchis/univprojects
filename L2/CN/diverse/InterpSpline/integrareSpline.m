function yiAprox = derivareSpline(x, y, xAprox)
% calculeaza o primitiva a functiei y(x) yiAprox = int(y, a, x), unde a = x(1)
% x si y - punctele pe care se face interpolarea spline
% xAprox - punctele pe care se calculeaza derivata

	n = length(x);
	[yAprox, c] = interpSplineNaturale(x,y,xAprox);
	
	%P[i](x) = c[4i-3] + c[4i-2] *(x - xi) + c[4i-1] *(x - xi)^2 + c[4i] *(x - xi)^3;
	%int(P[i](x)) = c[4i-3] * (x-xi)  + 1/2*c[4i-2] *(x - xi)^2 + 1/3*c[4i-1] *(x - xi)^3 + 1/4*c[4i] *(x - xi)^4;
	
	yint(1) = 0;
	for i = 2:length(x)-1
		deltaX = x(i)-x(i-1);
		yint(i) = yint(i-1) + c(4*i - 3) * deltaX + 1/2*c(4*i - 2)*deltaX^2 + 1/3*c(4*i-1)*deltaX^3 + 1/4*c(4*i)*deltaX^4;
	end;
	
	for k = 1:length(xAprox)
		xk = xAprox(k);
		% gaseste nodurile intre care se gaseste xk; cik se mai poate optimiza
		for i = 1:n-1
			if x(i) <= xk & xk <= x(i+1)
				break;
			end
		end
		yiAprox(k) = yint(i) + c(4*i - 3) * (xk-x(i)) + 1/2*c(4*i - 2)*(xk - x(i))^2 + 1/3*c(4*i-1)*(xk -x(i))^3 + 1/4*c(4*i)*(xk -x(i))^4;
	end    

end