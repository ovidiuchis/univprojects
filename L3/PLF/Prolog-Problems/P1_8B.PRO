/*Sa se scrie un predicat care adauga intr-o lista
dupa fiecare element par valoarea 1.*/

domains
        elem=integer
        list=elem*
predicates
         par(elem)
         adaug(list,list)
clauses
        par(E):-
           E mod 2=0.
        adaug([],[]).
        adaug([H|T],[H|[1|T1]]):-
            par(H),
            adaug(T,T1).
        adaug([H|T],[H|T1]):-
          not(par(H)),
          adaug(T,T1).