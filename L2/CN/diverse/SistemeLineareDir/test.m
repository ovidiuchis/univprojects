
A=[2.0000 0 2.0000 0.6000;
3.0000 3.0000 4.0000 -2.0000;
5.0000 5.0000 4.0000 2.0000;
-1.0000 -2.0000 3.4000 -1.0000];

y=[1;2;3;4];




x1= A \ y;
x2=rezolvaGauss(A,y);
x3=rezolvaLUP(A,y);
x4=rezolvaCholesky(transpose(A)*A,transpose(A)*y);


disp(x1);
disp(x2);
disp(x3);
disp(x4);