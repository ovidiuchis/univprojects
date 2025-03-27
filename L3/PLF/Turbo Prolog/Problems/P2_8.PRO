/*Sa se sorteze o lista cu eliminarea dublurilor.
Exemplu: [4,2,6,2,3,4]->[2,3,4,6].*/

domains
       elem=integer
       list=elem*
predicates
          sort(list,list) %(i,o)
          inserare(elem,list,list) %(i,i,o)
clauses
        inserare(X,[],[X]).
        inserare(X,[Y|L],[X,Y|L]):-
           X<Y,
           !.
        inserare(X,[Y|L1],[Y|L2]):-
           X>Y,
           inserare(X,L1,L2).
        inserare(X,[X|L],[X|L]).
        
        sort([],[]).
        sort([X|L],L2):-
           sort(L,L3),
           inserare(X,L3,L2).