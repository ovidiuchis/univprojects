function lim=iter(e1,err)
n=2;
en=e1;
en1=1-n*en;
while(abs(en-en1)>err & en1~=Inf)
    en=en1;
    n=n+1;
    en1=1-n*en;
end
lim=en1;