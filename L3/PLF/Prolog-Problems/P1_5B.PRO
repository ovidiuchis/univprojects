/*Sa se elimine prima aparitie a elementului minim
dintr-o lista de numere intregi.*/

domains
        elem=integer
        list=elem*
predicates
          minim(list,elem)
          elimina(elem,list,list)
          eliminare(list,list)
clauses
        minim([E],E).
        minim([E|L],E):-
          minim(L,E1),
          E<=E1.
        minim([H|T],E):-
          minim(T,E),
          E<H.
        eliminare(L1,L2):-
          minim(L1,Min),
          elimina(Min,L1,L2).
       elimina(_,[],[]).
       elimina(E,[E|T],T).
         % elimina(E,T,T2).
       elimina(E,[H|T],[H|T2]):-
          E<>H,
          elimina(E,T,T2).   