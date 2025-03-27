function integrala=trapz(x,y)
s=0;
for i=1:length(x-1
    s=s+(x(i+1)-x(i))*(y(i+1)+y(2))/2;
end
integrala=s;
