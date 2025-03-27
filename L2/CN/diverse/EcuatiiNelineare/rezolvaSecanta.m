function solutie = rezolvaSecanta(f, x0,x1, eps)

NMAX = 100;
% rezolva aproximativ ecuatia f(x) = 0 cu precizia eps, 
% fd este derivata lui f 
% x0 este solutia initiala
% NMAX - numarul maxim de iteratii, poate fi dat si ca argument

i = 2;
succes = false;
p_vechi = x0;
p_nou = x1;
x_vechi  = x0;
q_vechi = f(p_vechi);
q_nou = f(p_nou);
while i<NMAX
    p = p_nou - q_nou*(p_nou-p_vechi)/(q_nou-q_vechi);
    if(abs(p-p_nou)<eps) 
        succes = true;
        break;
    end;
    x_vechi = p_vechi;
    q_vechi = q_nou;
    p_vechi = p_nou;
    p_nou = p;
    q_nou=f(p);
    i = i+1;
end;

if ~succes 
    error('Nu am gasit solutia (e posibil ca ecuatia nu are solutie)');
end
% daca s-au facut NMAX iteratii si solutia nu a fost gasita, raportam ca nu


solutie = p;