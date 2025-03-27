function rezultat=radacini(n)

a=[1,-1];
x=1:0.01:n;
y=zeros(1,length(x));
t=ones(1,length(x));

for i=2:n
    a1=cat(2,a,[0]);
    a2=cat(2,[0],a);
    a=a1-i*a2;
end

% sistem perturbat
ap=a + normrnd(0,1e-10, 1,n + 1);

for k=1:n+1
    y = y + t * a(n+2-k);
    y = y + t * ap(n+2-k);
    t = t .* x;
end

rezultat=roots(ap)