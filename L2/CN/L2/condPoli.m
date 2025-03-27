function condPoli(n)

p=[1 ,-1];

for k=2:n
    pn(1) = p(1);
    for i=2:k
        pn(i) =  p(i) - k*p(i-1);
    end
    pn(k+1)=-k*p(k);
    p = pn;
end
disp(p);
x=roots(p);
disp(x);
