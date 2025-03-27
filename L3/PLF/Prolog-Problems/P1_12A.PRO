/*Sa se scrie un predicat care testeaza egalitatea
a doua multimi, fara sa se faca apel la diferenta 
a doua multimi.*/

domains
        elem=integer
        list=elem*
predicates
          equal(list,list)
clauses
        equal([],[]).
        equal([H|_],[H1|_]):-
          H<>H1,
          fail.
        equal([H|T],[H|T1]):-
          equal(T,T1).