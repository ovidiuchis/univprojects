%Sa se calculeze suma alternanta a elementelor unei liste 
%(l1 - l2 + l3 ...).
domains
  el=integer
  list=el*
predicates
  suma(list,el,el)
clauses
  suma([],_,0).
  suma([H|T],A,S):-A=1,A1=0,suma(T,A1,S1),S=S1+H,!.
  suma([H|T],A,S):-A=0,A1=1,suma(T,A1,S1),S=S1-H.
goal
  suma([2,3,4,2,4],A,S),
  write(S),nl.