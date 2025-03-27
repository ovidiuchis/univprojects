%Un arbore binar se memoreaza in PROLOG folosind urmatoarele declaratii de
%domenii:
%        element = symbol
%        arbore  = arb(element, arbore, arbore); nil
%Sa se construiasca un predicat care sa indice calea de la radacina unui arbore
%binar la un anumit nod.
domains
  element = integer
  arbore  = arb(element,arbore,arbore);nil
  list = element*
predicates
  create(element,arbore)
  insertLeft(arbore,arbore,arbore)
  insertRight(arbore,arbore,arbore)
  preordine(arbore)
  nondeterm cale(arbore,element,list)
clauses
  create(E,arb(E,nil,nil)).
  insertLeft(A,arb(E,_,D),arb(E,A,D)).
  insertRight(A,arb(E,S,_),arb(E,S,A)).
  preordine(nil).
  preordine(arb(R,S,D)):-write(R),
                         preordine(S),
                         preordine(D).
%  cale(nil,_,_).
  cale(arb(R,_,_),E,[E]):-R=E,!.
  cale(arb(R,S,_),E,[R|Y]):-R<>E,
                            cale(S,E,Y).
  cale(arb(R,_,D),E,[R|Y]):-R<>E,
                            cale(D,E,Y).
goal
  create(1,S),
  insertLeft(arb(2,nil,nil),S,C),
  insertRight(arb(3,nil,arb(4,nil,nil)),C,A),
  cale(A,4,X),
  write(X),nl.