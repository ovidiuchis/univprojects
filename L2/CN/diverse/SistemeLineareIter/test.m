function test(n)
    A= 5*diag(ones(1,n))+(-1)*diag(ones(1,n-1),1)+(-1)*diag(ones(1,n-1),-1);
    b=3*ones(n,1); b(1)=4; b(n)=4;

    x1 = A \ b;
    x2=rezolvaJacobiIterativ(A, b, 1e-6);    
    x3=rezolvaGaussIterativ(A, b, 1e-6);
	x4=rezolvaSORIterativ(A, b, 1.5, 1e-6);
	
	disp(x1);
    disp(x2);
	disp(x3);
	disp(x4);
	
    A=rand(n)+n*diag(ones(n,1));
    x0=transpose(1:n);
    b=A*x0;
	
	
    x1 = A \ b;
    x2=rezolvaJacobiIterativ(A, b, 1e-6);    
    x3=rezolvaGaussIterativ(A, b, 1e-6);
	x4=rezolvaSORIterativ(A, b, 0.5, 1e-6);
	
	disp(x1);
    disp(x2);
	disp(x3);
	disp(x4);
end
