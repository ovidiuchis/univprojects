function e_n1=ep(prec)
n=1;
e_n=en(n);
e_n1=en(n+1);
while abs((e_n-e_n1)/e_n)>prec
    n=n+1;
    e_n=en(n);
    e_n1=en(n+1);
end