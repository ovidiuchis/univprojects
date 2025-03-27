function eps=epsM()

% calculeaza "epsilon-ul masinii"
    eps=1;
    while 1+eps/2~=1
        eps=eps/2;
    end
    
    return;
    % valoarea returnata de eps in Matlab pana aici
    
    % putem eventual "imbunatati" valoarea gasita:    
    eps1=eps/2;
    eps2=eps;

    while eps2+1~=1
        eps=eps2;
        eps2=(eps2+eps1)/2;
    end
end