%suma valorilor elevalorilor unui arbore binar
domains
   elem=integer
   tree=arb(elem,tree,tree);nil
predicates
   create_tree(elem,tree)
   insl(tree,tree,tree)
   insr(tree,tree,tree)
   suma(tree,integer)
clauses
  create_tree(E,arb(E,nil,nil)).
  insl(A,arb(E,_,D),arb(E,A,D)).
  insr(A,arb(E,S,_),arb(E,S,A)).
  suma(nil,0).
  suma(arb(R,S,D),SM):-
                        suma(S,SUM1),
                        suma(D,SUM2),
                        SM=R+SUM1+SUM2.