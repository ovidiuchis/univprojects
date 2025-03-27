function solutie = rezolvaNewtonRaphson(f, fd, x0, eps)

NMAX = 100;
% rezolva aproximativ ecuatia f(x) = 0 cu precizia eps, 
% fd este derivata lui f 
% x0 este solutia initiala
% NMAX - numarul maxim de iteratii, poate fi dat si ca argument

i = 1;
succes = false;
x_vechi  = x0;
while i<NMAX
    x_nou = x_vechi - inv(fd(x_vechi))*f(x_vechi);
    if(abs(x_vechi-x_nou)<eps) 
        succes = true;
        break;
    end;
    x_vechi = x_nou;
    i = i+1;
end;

if ~succes 
    error('Nu am gasit solutia (e posibil ca ecuatia nu are solutie)');
end
% daca s-au facut NMAX iteratii si solutia nu a fost gasita, raportam ca nu


solutie = x_nou;