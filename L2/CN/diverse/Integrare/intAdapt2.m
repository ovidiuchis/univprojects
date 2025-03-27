function ret=intAdapt2(f,a,b,tol)
    ret = pasCuadratura(f, a, b, tol, f(a), f((a+b)/2), f(b));
end

function int = pasCuadratura(f, a, b, tol, fa, fc, fb)
    %fprintf('a=%g b=%d\n',a,b);

    h = b-a; c = (a+b)/2;
    fd = f((a+c)/2);
    fe = f((b+c)/2);
    int1 = h/6*(fa+4*fc+fb);
    int2 = h/12*(fa+4*fd+2*fc+4*fe+fb);
    
    if abs(int1-int2)<tol
        int = int2 + (int2-int1)/15;
    else
        int = pasCuadratura(f,a,c,tol,fa,fd,fc) + pasCuadratura(f,c,b,tol,fc,fe,fb);
    end
end