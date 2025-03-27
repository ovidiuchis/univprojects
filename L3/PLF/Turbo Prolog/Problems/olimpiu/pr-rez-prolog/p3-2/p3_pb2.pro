domains
  element = integer
  arbore  = arb(element,arbore,arbore);nil
predicates
  create(element,arbore)
  insertLeft(arbore,arbore,arbore)
  insertRight(arbore,arbore,arbore)
  suma(arbore,element,element)
clauses
  create(E,arb(E,nil,nil)).
  insertLeft(A,arb(E,_,D),arb(E,A,D)).
  insertRight(A,arb(E,S,_),arb(E,S,A)).
  suma(nil,_,0).
  suma(arb(R,S,D),N,M):-N1=N+1,
                        suma(S,N1,M1),
                        suma(D,N1,M2),
                        M=M1+M2+R.
goal
  create(1,S),
  insertLeft(arb(2,nil,nil),S,C),
  insertRight(arb(3,nil,arb(4,nil,nil)),C,A),
  suma(A,1,X).