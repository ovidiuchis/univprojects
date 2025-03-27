
/*                LABORATOR NR 4

     Sa se construiasca un predicat care intoarce 
      suma elementelor din nodurile unui arbore */


domains
  treetype=tree(integer,treetype,treetype);nil
predicates
  suma(treetype,integer)
clauses
  suma(nil,0).
  suma(tree(E,X,Y),S):-
     suma(X,M),
     suma(Y,L),
     S=M+L+E.
