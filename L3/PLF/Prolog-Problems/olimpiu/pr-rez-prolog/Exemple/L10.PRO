domains
  list=symbol*

predicates
  minim(list,symbol)
  elimin(symbol,list,list)
  sort(list,list)

clauses
  minim([S],S).
  minim([S|T],S) :- minim(T,S1),S<=S1.
  minim([H|T],S) :- minim(T,S),S<H.

  elimin(_,[],[]).
  elimin(S,[S|T1],T2) :- elimin(S,T1,T2).
  elimin(S,[H|T1],[H|T2]) :- S<>H,elimin(S,T1,T2).

  sort([],[]).
  sort(L,[H|T]) :- minim(L,H),elimin(H,L,Ln),sort(Ln,T).
     
      