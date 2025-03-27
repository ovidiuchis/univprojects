domains
  el=integer
  lista=el*
predicates
  elim(lista,lista)
clauses
  elim([],[]).
  elim([H|[]],[H]).
  elim([H|[H1|[H2|T]]],[H1|[H2|T1]]):- H1=H+1,H2=H1+1, elim([H1|[H2|T]],[H2|T1]),!.
  elim([H|[H1|T]],T1):- H1=H+1, elim(T,T1),!.
  elim([H|T],[H|T1]):- elim(T,T1).    
  