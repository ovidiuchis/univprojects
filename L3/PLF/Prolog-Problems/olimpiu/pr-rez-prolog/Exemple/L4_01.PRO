/* sa se construiasca un predicat care intoarce 
                nr. nodurilor unui arbore binar */
domains
  treetype=tree(integer,treetype,treetype);empty
predicates
  nrnoduri(treetype,integer)
clauses
  nrnoduri(empty,0).
  nrnoduri(tree(_,X,Y),N):-
     nrnoduri(X,M),
     nrnoduri(Y,L),
     N=M+L+1.
