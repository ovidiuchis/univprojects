/* P3 Problema 10: 
   Sa se construiasca un predicat care verifica
   daca un arbore binar este echilibrat.
   
   Un arbore este echilibrat <=> 
      | depth(arb_stang)-depth(arb_drept) | <=1 
   
    */
domains
  arbore=arb(element,arbore,arbore);nil
predicates
  adancime(treetype,integer)
clauses
  adancime(empty,0).
  adancime(tree(_,S,D),N):-
    adancime(S,N1),
    adancime(D,N2),
    N1>=N2,
    N=N1+1.
  adancime(tree(_,S,D),N):-
    adancime(S,N1),
    adancime(D,N2),
    N1<N2,
    N=N2+1.