M=[10 7 8 7
7 5 6 5
8 6 10 9
7 5 9 10];

Y = [32
23
33
31];

disp(M \ Y);

Y1 = Y + (rand(4,1)-0.5)/5;
disp(M \ Y1);

M1 = M + (rand(4,4)-0.5)/5;
disp(M1 \ Y);

disp(cond(M))