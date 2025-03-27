/*Sa se sorteze o lista cu pastrearea dublurilor.*/

domains
        elem=integer
        list=elem*
predicates
          sort(list,list)
          insereaza(elem,list,list)
clauses
        insereaza(X,[],[X]).
        insereaza(X,[Y|L],[X,Y|L]):-
           X<=Y,
           !.
        insereaza(X,[Y|L1],[Y|L2]):-
           X>Y,
           insereaza(X,L1,L2).
        
        sort([],[]).
        sort([X|L],L2):-
          sort(L,L3),
          insereaza(X,L3,L2).