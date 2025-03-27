/*    Definiti un predicat care obtine lista 
   tuturor  nodurilor unui arbore dat.
      Arborele se va parcurge in postordine.      */
domains
  treetype=tree(integer,treetype,treetype);empty
  list=integer*
predicates
  postordine(treetype,list)
  conc(list,list,list)
clauses
  conc([],L,L).
  conc([X|L1],L2,[X|L3]):-
                          conc(L1,L2,L3). 
  postordine(empty,[]).
  postordine(tree(R,S,D),L):-
    postordine(D,L1),
    postordine(S,L2),
    conc(L2,L1,L3),
    conc(L3,[R],L).