function [a] = getAi(x,i)

m = length(x);

pr = 1;

for j =1:m
    if j ~= i 
    pr = pr * (x(j)-x(i));
    end;
end;

a = 1/pr;






