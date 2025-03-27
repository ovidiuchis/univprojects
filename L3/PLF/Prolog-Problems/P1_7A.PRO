/*Sa se scrie un predicat care transforma o
lista intr-o multime.*/

domains
        elem=integer
        list=elem*
predicates
          apare(elem,list)
          multime(list,list)
          adauga(elem,list,list)
          invers(list,list)
          %run(list,list)
clauses
        invers([],[]).
        invers([A|L],X):-
          invers(L,Y),
          adauga(A,Y,X).
        apare(E,[E|_]).
        apare(E,[_|T]):-
          apare(E,T).
        adauga(E,[],[E]).
        adauga(E,[A|L],[A|X]):-
          adauga(E,L,X).
       multime([],[]).
       multime([H|T],L):-
         multime(T,L1),
         not(apare(H,L1)),
         adauga(H,L1,L).
      multime([H|T],L):-
         apare(H,L),
         multime(T,L).
         