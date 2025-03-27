% a)
w = [  10 7 8 7
       7 5 6 5
       8 6 10 9
       7 5 9 10
   ];
   % '  transpunere
   b= [ 32 23 33 31 ]';
   x = w \ b;
   disp(x);
   b1= [32.1 22.9 33.1 30.9]';
   x1 = w\b1;
   disp(x1);
   
   fprintf( 'cond=%g\n',norm(x1-x)/norm(b1-b));
   fprintf('nr cond=%g\n',cond(w));
   
   fprintf('\n\n');   
   
   % b)
   w1= [ 10 7 8.1 7.2
        7.8 5.04 6 5
        8 5.98 9.89 9
        6.99 4.99 9 9.98 
    ];
    
    x2=w1\b;

    fprintf( 'cond=%g\n',norm(x2-x)/norm(w1-w)); 