function solutie = rezolvaAproxSuccesive(f, J, x0, eps)

NMAX = 1000;
% rezolva aproximativ ecuatia f(x) = 0 cu precizia eps, 
% x0 este solutia initiala
% NMAX - numarul maxim de iteratii, poate fi dat si ca argument

Lambda = - inv(J(x0));

phi = @(x) x + Lambda * f(x);

i = 1;
succes = false;
x_vechi  = x0;
while i<NMAX
    x_nou = phi(x_vechi);
    if(norm(x_vechi-x_nou)/max(max(norm(x_vechi), norm(x_nou)), eps)<eps) 
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