
domains
  el=integer
  lista=el*

predicates
  intercls(lista,lista,lista)
  elimin(lista,lista)
  inter(lista,lista,lista)

clauses
  elimin([],[]):-!.
  elimin([H,H],[H]):-!.
  elimin([H1,H2],[H1,H2]):-!.
  elimin([H|[H|T]],L):-elimin([H|T],L),!.
  elimin([H1|[H2|T]],L):- elimin([H2|T],L1),L=[H1|L1],!.
  
  intercls(L,[],L):-!.
  intercls([],L,L):-!.
  intercls([H1|T1],[H2|T2],L):- H1<H2,!,intercls(T1,[H2|T2],L1),L=[H1|L1]. 
  intercls([H1|T1],[H2|T2],L):- H1>H2,!,intercls([H1|T1],T2,L1),L=[H2|L1].
  intercls([H1|T1],[H2|T2],L):- intercls([H1|T1],T2,L).             
    
  inter(L1,L2,L):- elimin(L1,L3), elimin(L2,L4), intercls(L3,L4,L).  