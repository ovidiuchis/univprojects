/* sa se construiasca un predicat care intoarce 
      suma elementelor din nodurile unui arbore */
domains
  treetype=tree(integer,treetype,treetype);empty
predicates
  suma(treetype,integer)
clauses
  suma(empty,0).
  suma(tree(E,X,Y),S):-
     suma(X,M),
     suma(Y,L),
     S=M+L+E.
