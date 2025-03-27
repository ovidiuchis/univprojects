n = 5;
v = ones(n, 1);
A = diag(v) + rand(n);
y= A * ones(n, 1);


x1= A \ y;
x2=rezolvaGauss(A,y);
x3=rezolvaLUP(A,y);
x4=rezolvaCholesky(transpose(A)*A,transpose(A)*y);


disp(x1);
disp(x2);
disp(x3);
disp(x4);