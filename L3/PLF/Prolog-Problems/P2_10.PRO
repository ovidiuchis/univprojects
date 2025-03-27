/*Sa se interclaseze fara pastrarea dublurilor.*/

domains
      elem=integer
      list=elem*
predicates
        inter(list,list,list)
clauses
       inter([],L,L):-!.
       inter(L,[],L):-!.
       inter([H|T],[X|Y],[H|T1]):-
         H<X,
         inter(T,[X|Y],T1),
         !.
       inter([H|T],[X|Y],[X|T1]):-
         H>=X,
         inter([H|T],Y,T1),
         !.
       inter([H|T],[X|Y],[X|T1]):-
          H=X,
          inter(T,Y,T1).