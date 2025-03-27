%Se da o lista de numere intregi. Se cere sa se elimine toate subsirurile
%formate din elemente descrescatoare.
domains
  el=integer
  list=el*
predicates
  elim(list,list)
  descr(list)
clauses
  descr([]).
  descr([H|[H1|_]]):-H>=H1.
  elim([],[]):-!.
  elim([H|T],T1):-descr([H|T]),!,elim(T,T1).
  elim([H|T],[H|T1]):-elim(T,T1).
goal
  elim([3,4,5,7,6,5,9,4,1,2,3],X),
  write(X),nl.