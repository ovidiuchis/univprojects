%Un arbore binar se memoreaza in PROLOG folosind urmatoarele declaratii de domenii:
%          element = symbol
%          arbore  = arb(element, arbore, arbore); nil
%Sa se construiasca un predicat care substituie un element prin altul in toate
%nodurile unui arbore binar
domains
  element = integer
  arbore  = arb(element,arbore,arbore);nil
predicates
  create(element,arbore)
  insertLeft(arbore,arbore,arbore)
  insertRight(arbore,arbore,arbore)
  preordine(arbore)
  subst(arbore,element,element,arbore)
clauses
  create(E,arb(E,nil,nil)).
  insertLeft(A,arb(E,_,D),arb(E,A,D)).
  insertRight(A,arb(E,S,_),arb(E,S,A)).
  preordine(nil).
  preordine(arb(R,S,D)):-write(R),
                         preordine(S),
                         preordine(D).
  subst(nil,_,_,nil).
  subst(arb(R,S,D),E,X,arb(Y,S1,D1)):-R=E,Y=X,
                                      subst(S,E,X,S1),
                                      subst(D,E,X,D1),!.
  subst(arb(R,S,D),E,X,arb(R,S1,D1)):-R<>E,
                                      subst(S,E,X,S1),
                                      subst(D,E,X,D1),!.
goal:
  create(1,S),
  insertLeft(arb(2,nil,nil),S,C),
  insertRight(arb(3,nil,arb(4,nil,nil)),C,A),
  subst(A,2,7,X),
  preordine(X),
  write("\n").