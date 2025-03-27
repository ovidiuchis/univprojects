function rezultat = intRomberg(f, a, b, eps)
% calculeaza integrala din f de la a la b cu precizia eps

    hk = (b-a);
    R(1,1) = hk * (f(a) + f(b)) / 2;

    int_nou = R(1,1); 
    int_vechi = int_nou + 2*eps; 
    % ne asiguram ca nu e indeplinita conditia la primul test in while

    k = 1;
    while(abs(int_nou-int_vechi)>eps)
        int_vechi = int_nou;
        k = k+1;
        

        i = 1:2^(k-2);
        noduri = a+(i-1/2)*hk;
        
        R(k, 1) = 1/2 * (R(k-1, 1) + hk * sum(f(noduri)));
        
        for j = 2:k
            R(k,j) = (4^(j-1)*R(k, j-1) - R(k-1, j-1))/(4^(j-1)-1);
        end;
        
        int_nou = R(k,k);
        
        hk = hk / 2;
    end;

    rezultat = int_nou;
end