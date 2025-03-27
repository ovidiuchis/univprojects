domains
  list=symbol*
predicates
  sterg(symbol,list,list)
clauses
  sterg(_,[],[]).
  sterg(S,[S|H],M):-
    sterg(S,H,M).
  sterg(S,[X|H],[X|M]):-
    sterg(S,H,M),
    X<>S.
  