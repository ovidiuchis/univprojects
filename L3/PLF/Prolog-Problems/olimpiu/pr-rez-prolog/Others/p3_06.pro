/*    Definiti un predicat care obtine lista 
   tuturor  nodurilor unui arbore dat.
      Arborele se va parcurge in preordine.      */
domains
  elem=integer
  arbore=arb(elem,arbore,arbore);nil
  list=elem*
predicates
  preordine(arbore,list)
  conc(list,list,list)
clauses
  conc([],L,L).
  conc([X|L1],L2,[X|L3]):-
                          conc(L1,L2,L3). 
  preordine(nil,[]).
  preordine(arb(R,S,D),L):-
    preordine(D,L1),
    preordine(S,L2),
    conc([R],L2,L3),
    conc(L3,L1,L).