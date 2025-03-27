/* Sa se scrie un predicat care elimina primele 3
aparitii ale unui element intr-o lista.Daca elementul
apare mai putin de 3 ori, se va elimina de cate ori
apare.*/

domains
        elem=integer
        list=elem*
predicates
          elimin(elem,list,list)
          tip(list)
          run(integer,list)
clauses
        tip([]):-nl.
        tip([H|T]):-
         write(H," "),
         tip(T),
         !.
        elimin(E,[],[]):-!.
        elimin(E,[H|T],L1):-
           E=H,
           L1=T,
           elimin(E,T,L1).
        elimin(E,[_|T],L1):-
            elimin(E,T,L1),!.
        run(E,L):-
            elimin(E,L,X),
            tip(X).