/*    Definiti un predicat care obtine lista 
   tuturor  nodurilor unui arbore dat.
      Arborele se va parcurge in inordine.      */
domains
  treetype=tree(integer,treetype,treetype);empty
  list=integer*
predicates
  inordine(treetype,list)
  conc(list,list,list)
clauses
  conc([],L,L).
  conc([X|L1],L2,[X|L3]):-
                          conc(L1,L2,L3). 
  inordine(empty,[]).
  inordine(tree(R,S,D),L):-
    inordine(D,L1),
    inordine(S,L2),
    conc(L2,[R],L3),
    conc(L3,L1,L).