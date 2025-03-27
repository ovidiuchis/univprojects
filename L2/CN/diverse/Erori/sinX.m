function rezultat=sinX(x,err)
% Calculeaza sin(x) cu precizia err prin dezvoltare in serie Taylor

    %reducem la intervalul 0..2pi
    x=x-floor(x/2/pi)*2*pi;

    sinx=x;
    j=3; 
    term=x; 
    
    while abs(term)>err
        term = - term * x^2/j/(j-1);
        sinx=sinx + term;
        
        j=j+2;
    end
    
    rezultat=sinx;
end