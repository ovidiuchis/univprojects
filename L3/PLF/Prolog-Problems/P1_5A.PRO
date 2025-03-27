/*Sa se scrie un predicat carese va satisface daca
o lista are numar par de elemente si se va esua in 
caz contrar, fara sa se numere elementele
listei.*/

domains
        elem=integer
        list=elem*
predicates
           par(list)
clauses
         par([]).
         par([_|[_|E]]):-
           par(E).