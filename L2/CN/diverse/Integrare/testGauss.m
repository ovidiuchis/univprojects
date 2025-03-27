
% Gauss Legendre
int1 = intGaussLegendre( @(x)x.^8, 100);
intCorect = 2.0/9;
fprintf('Gauss Legendre, eroarea relativa = %g\n', abs(1-int1/intCorect));

% mai jos, inmultim cu 1/pondere ca sa ii anulam efectul, dar in mod obisnuit ponterea trebuie folosita inteligent

% Gauss Cebisev 1
int2 = intGaussCebisev1(@(x)x.^8 .* sqrt(1-x.^2), 200);
fprintf('\nGauss Cebisev 1, f = ... eroarea relativa = %g\n', abs(1-int2/intCorect));

% Gauss Cebisev 2
int3 = intGaussCebisev2(@(x)x.^8 ./ sqrt(1-x.^2), 200);
fprintf('\nGauss Cebisev 2, eroarea relativa = %g\n', abs(1-int3/intCorect));

% Gauss Laguerre
int4 = intGaussLaguerre(@(x)ones(length(x), 1), 0, 200);
intCorect = 1;
fprintf('\nGauss Laguerre, f=1, alpha = 0, eroarea relativa = %g\n', abs(1-int4/intCorect));

int5 = intGaussLaguerre(@(x)x, 1, 200);
intCorect = 2; % vezi de ex  http://integrals.wolfram.com/
fprintf('Gauss Laguerre, f(X)=x, alpha = 1, eroarea relativa = %g\n', abs(1-int5/intCorect));

int6 = intGaussLaguerre(@(x)sin(x).*x, 1, 200);
intCorect = 1/2; % vezi de ex http://integrals.wolfram.com/
fprintf('Gauss Laguerre, f(X)=sin(x), alpha = 2, eroarea relativa = %g\n', abs(1-int6/intCorect));

% Gauss Jacobi
int7 = intGaussJacobi(@(x)(1-x), 3, 2,  20);
primitiva = @(x) x - x^2 - x^3/3 + x^4 - x^5/5 - x^6/3 + x^7/7; % vezi de ex http://integrals.wolfram.com/
intCorect = primitiva(1)-primitiva(-1);
fprintf('\nGauss Jacobi, f(X)=1-x, alpha = 3, beta = 2,  eroarea relativa = %g\n', abs(1-int7/intCorect));

int8 = intGaussJacobi(@(x)sin(x), 4, 3,  20);
primitiva = @(x) (-((799 - 5419*x - 399*x^2 + 903*x^3 + 33*x^4 - 45*x^5 - x^6 + x^7)*cos(x)) + (-5419 - 798*x + 2709*x^2 + 132*x^3 - 225*x^4 - 6*x^5 + 7*x^6)*sin(x)); 
% vezi de ex http://integrals.wolfram.com/
intCorect = primitiva(1)-primitiva(-1);
fprintf('Gauss Jacobi, f(X)=sin(x), alpha = 4, beta =3, eroarea relativa = %g\n', abs(1-int8/intCorect));


% Gauss Hermite
int9 = intGaussHermite( @(x)ones(length(x), 1), 10);
intCorect = sqrt(pi);
fprintf('\nGauss Hermite f=1, eroarea relativa = %g\n', abs(1-int9/intCorect));

int10 = intGaussHermite( @(x)exp(3/4*x.^2), 100);
intCorect = sqrt(pi)*2;
fprintf('Gauss Hermite, f = exp(..) eroarea relativa = %g\n', abs(1-int10/intCorect));
