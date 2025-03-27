
domains
  el=integer
  list=el*
predicates
  egal(list,list)
  maimicegal(list,list)
  maimic(list,list)
clauses
  egal([],[]).
  egal([H|T],[X|Y]):-H=X,!,egal(T,Y).
  maimicegal([],_).
  maimicegal([H|T],[X|Y]):-H<=X,!,maimicegal(T,Y).
  maimic(L,F):-not(egal(L,F)),maimicegal(L,F).
goal
