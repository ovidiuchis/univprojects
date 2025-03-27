%Sa se interclaseze fara pastrarea dublurilor doua liste sortate.
domains
  el=integer
  list=el*
predicates
  inter(list,list,list)
clauses
  inter([],L,L):-!.
  inter(L,[],L).
  inter([H|T],[X|Y],[H|T1]):-H<X,inter(T,[X|Y],T1),!.
  inter([H|T],[X|Y],[X|T1]):-H>X,inter([H|T],Y,T1),!.
  inter([H|T],[X|Y],[X|T1]):-H=X,inter(T,Y,T1),!.
  inter([H|T],[X|Y],[H|[X|T1]]):-H<>X,inter(T,Y,T1),!.
goal
  inter([1,2,3,4,8],[2,6,7,8,9],X),
  write(X),nl.
  