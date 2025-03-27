%Un arbore binar se memoreaza in PROLOG folosind urmatoarele declaratii de
%domenii:
%       element = symbol
%        arbore  = arb(element, arbore, arbore); nil
%Sa se construiasca un predicat care intoarce suma valorilor nodurilor unui
%arbore binar, inmultite cu numarul nivelului pe care se afla.De ex, pentru
%arborele arb(10, nil, arb(12, nil, nil)), nil) suma va fi 10*1+11*2+12*3=68
domains
  element = integer
  arbore  = arb(element,arbore,arbore);nil
predicates
  create(element,arbore)
  insertLeft(arbore,arbore,arbore)
  insertRight(arbore,arbore,arbore)
  preordine(arbore)
  suma(arbore,element,element)
clauses
  create(E,arb(E,nil,nil)).
  insertLeft(A,arb(E,_,D),arb(E,A,D)).
  insertRight(A,arb(E,S,_),arb(E,S,A)).
  preordine(nil).
  preordine(arb(R,S,D)):-write(R),
                         preordine(S),
                         preordine(D).
  suma(nil,_,0).
  suma(arb(R,S,D),N,M):-N1=N+1,
                        suma(S,N1,M1),
                        suma(D,N1,M2),
                        M=M1+M2+R*N.
goal
  create(1,S),
  insertLeft(arb(2,nil,nil),S,C),
  insertRight(arb(3,nil,arb(4,nil,nil)),C,A),
  preordine(A),nl,
  suma(A,1,X),
  write(X),nl.