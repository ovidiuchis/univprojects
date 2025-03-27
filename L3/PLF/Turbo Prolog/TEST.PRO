
domains 
  list=symbol*
predicates
  make(list)
  length(list,integer)
  uniq(list,list)
  member(symbol,list)
clauses
  make([X|L]):-  readln(X), !, make(L).
  make([]).
  
  member(X,[X|_]):- !.
  member(X,[_|L]):-  member(X,L).
  
  uniq([],[]).
  uniq([H|T],L):-  member(H,T), !, uniq(T,L).
  uniq([H|T],[H|L]):- uniq(T,L).
  
  length([],0):-  !.
  length([_|T],N):-  length(T,N1), N=N1+1.
  
goal
  write("<ESC> stops."), nl,
  make(L1), length(L1,N1), write(L1,"\t",N1), nl,
  uniq(L1,L2), length(L2,N2), write(L2,"\t",N2), nl.

    