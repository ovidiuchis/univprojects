domains
   list=integer*
predicates
   equal(list,list)
clauses
   equal([],[]).
   equal([H|_],[H1|_]):-
          H<>H1,fail.
   equal([H|T],[H|T1]):-equal(T,T1).          
