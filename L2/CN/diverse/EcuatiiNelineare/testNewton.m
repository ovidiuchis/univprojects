f=@(V)[V(1)^2+V(2)^2-1;V(1)^3-V(2)];
J=@(V)[2*V(1),2*V(2);3*V(1)^2,-1];

solutie = rezolvaNewton( f, J, [0.1;0.1], 1E-6);
fprintf('Pb 1. solutie = [%g %g] eroare = %g\n', solutie(1), solutie(2), norm(f(solutie)));

f2=@(v)[9*v(1)^2+36*v(2)^2+4*v(3)^2-36
v(1)^2-2*v(2)^2-20*v(3)
v(1)^2-v(2)^2+v(3)^2];

J2=@(v)[18*v(1), 72*v(2), 8*v(3)
2*v(1), -4*v(2), -20
2*v(1), - 2*v(2), 2*v(3)];


solutie2 = rezolvaNewton( f2, J2, [1;1;0], 1E-6);
fprintf('\nPb 2. Newton solutie = [%g %g %g] eroare = %g\n', solutie2(1), solutie2(2), solutie2(3), norm(f2(solutie2)));
solutie = rezolvaNewton( f2, J2, [1;-1;0], 1E-6);
fprintf('Pb 2. Newton solutie = [%g %g %g] eroare = %g\n', solutie2(1), solutie2(2), solutie2(3), norm(f2(solutie2)));
solutie = rezolvaNewton( f2, J2, [-1;1;0], 1E-6);
fprintf('Pb 2. Newton solutie = [%g %g %g] eroare = %g\n', solutie2(1), solutie2(2), solutie2(3), norm(f2(solutie2)));
solutie = rezolvaNewton( f2, J2, [-1;-1;0], 1E-6);
fprintf('Pb 2. Newton solutie = [%g %g %g] eroare = %g\n', solutie2(1), solutie2(2), solutie2(3), norm(f2(solutie2)));


solutie2 = rezolvaAproxSuccesive( f2, J2, [1;1;0], 1E-6);
fprintf('\nPb 2. (aprox succ) solutie = [%g %g %g] eroare = %g\n', solutie2(1), solutie2(2), solutie2(3), norm(f2(solutie2)));
solutie = rezolvaAproxSuccesive( f2, J2, [1;-1;0], 1E-6);
fprintf('Pb 2. (aprox succ) solutie = [%g %g %g] eroare = %g\n', solutie2(1), solutie2(2), solutie2(3), norm(f2(solutie2)));
solutie = rezolvaAproxSuccesive( f2, J2, [-1;1;0], 1E-6);
fprintf('Pb 2. (aprox succ) solutie = [%g %g %g] eroare = %g\n', solutie2(1), solutie2(2), solutie2(3), norm(f2(solutie2)));
solutie = rezolvaAproxSuccesive( f2, J2, [-1;-1;0], 1E-6);
fprintf('Pb 2. (aprox succ) solutie = [%g %g %g] eroare = %g\n', solutie2(1), solutie2(2), solutie2(3), norm(f2(solutie2)));



