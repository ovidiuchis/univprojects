domains
  el=integer
  list=el*
predicates 
  lgpar(list)
  suma(list,integer)
clauses
  lgpar([]).
  lgpar([_|T]):- not (lgpar(T)).      
  suma([H],S):- S=H,!.
  suma([H|T],S):- suma(T,S1), S=H-S1.
  suma([],0).
goal:
  suma([2,1,2,3],4).