i1 = intTrapeze(@(x) x^7,0,1,1000);
fprintf('Integrare trapeze\ni = %g   err = %g\n', i1, abs((i1-0.125)/0.125));

i2 = intSimpson(@(x) x^7,0,1,1000);
fprintf('Integrare Simpson\ni = %g   err = %g\n', i2, abs((i2-0.125)/0.125));

i3 = intAdaptTrapeze(@(x) x^7,0,1,1000,1e-8);
fprintf('Integrare trapeze adaptiva\ni = %g   err = %g\n', i3, abs((i3-0.125)/0.125));

i4 = intAdaptTrapeze(@(x) x^7,0,1,1000,1e-8);
fprintf('Integrare Simpson adaptiva\ni = %g   err = %g\n', i4, abs((i4-0.125)/0.125));

i5 = intAdapt2(@(x) x^7,0,1,1e-8);
fprintf('Integrare adaptiva 2\ni = %g   err = %g\n', i5, abs((i5-0.125)/0.125));