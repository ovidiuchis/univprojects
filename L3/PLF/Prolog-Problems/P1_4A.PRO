/*Sa se scrie un predicate care substituie intr-o 
lista un element prin altul.*/

domains
       elem=integer
       lista=elem*
predicates
         subst(elem,elem,lista,lista)
clauses
        subst(_,_,[],[]).
        subst(E1,E2,[E1|L],[E2|L1]):-
          !,
          subst(E1,E2,L,L1).
        subst(E1,E2,[H|L],[H|L1]):-
         !,
         subst(E1,E2,L,L1).