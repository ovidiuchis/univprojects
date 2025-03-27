/*Sa se elimine toate aparitiile elementului
maxim dintr-o lista de numere intregi.*/

domains
       elem=integer
       list=elem*
predicates
          maxim(list,elem)
          elimina(elem,list,list)
          eliminare(list,list)
clauses
        maxim([E],E).
        maxim([E|L],E):-
          maxim(L,Max),
          E>=Max.
        maxim([H|L],Max):-
          maxim(L,Max),
          Max>H.
        eliminare(L1,L2):-
          maxim(L1,Max),
          elimina(Max,L1,L2).
       elimina(_,[],[]):-!.
       elimina(E,[E|L1],L2):-
          elimina(E,L1,L2).
       elimina(E,[H|T],[H|T2]):-
         E<>H,
         elimina(E,T,T2).