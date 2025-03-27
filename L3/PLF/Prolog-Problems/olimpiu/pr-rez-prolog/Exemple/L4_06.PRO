/*    Definiti un predicat care obtine lista 
   tuturor  nodurilor unui arbore dat.
      Arborele se va parcurge in preordine.      */
domains
  treetype=tree(integer,treetype,treetype);empty
  list=integer*
predicates
  preordine(treetype,list)
  conc(list,list,list)
clauses
  conc([],L,L).
  conc([X|L1],L2,[X|L3]):-
                          conc(L1,L2,L3). 
  preordine(empty,[]).
  preordine(tree(R,S,D),L):-
    preordine(D,L1),
    preordine(S,L2),
    conc([R],L2,L3),
    conc(L3,L1,L).