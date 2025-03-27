% f = @(x, y) -sin(x);   % y'(x) = - six(x), y(0) = 1 --> solutia e cos(x)
% [xsol, ysol] = rezolvaRK4(f, 0, 1, 2*pi, 100);
% plot(xsol, ysol, xsol, cos(xsol));


% SISTEM DE ECUATII
% y' = yd
% yd' = -y
% y"(x) = - y(x)
f = @(x, y) [y(2); -y(1)]; % y(0) = 1, y'(0) = 0 --> solutia e cos(x)
[xsol, ysol] = rezolvaRK4(f, 0, [1 0], 2*pi, 100);
plot(xsol, ysol(1,:), xsol, cos(xsol));