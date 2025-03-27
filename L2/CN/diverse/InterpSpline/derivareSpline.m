function ydAprox = derivareSpline(x, y, xAprox)
% calculeaza derivata functiei y(x)
% x si y - punctele pe care se face interpolarea spline
% xAprox - punctele pe care se calculeaza derivata

	n = length(x);
	[yAprox, c] = interpSplineNaturale(x,y,xAprox);
	
	%P[i](x) = c[4i-3] + c[4i-2] *(x - xi) + c[4i-1] *(x - xi)^2 + c[4i] *(x - xi)^3;
	%P'[i](x) = c[4i-2]  + 2*c[4i-1] *(x - xi) + 3*c[4i] *(x - xi)^2;
	
	for k = 1:length(xAprox)
		xk = xAprox(k);
		% gaseste nodurile intre care se gaseste xk; cik se mai poate optimiza
		for i = 1:n-1
			if x(i) <= xk & xk <= x(i+1)
				break;
			end
		end
		ydAprox(k) = c(4*i - 2) + 2*c(4*i - 1)*(xk - x(i)) + 3*c(4*i)*(xk -x(i))^2;
	end    

end