/*Sa se determine pozitiile elementului maxim 
dintr-o lista liniare.*/

domains
       elem=integer
       list=elem*
predicates
          maxim(list,elem)
          maximPoz(elem,list,elem)
          %adauga(elem,list,list)
          run(list,list)
clauses
       
        maxim([E],E).
        maxim([E|T],E):-
           maxim(T,M1),
           M1<=E.
        maxim([E|T],M):-
           maxim(T,M),
           M>E.
        maximPoz(E,[E|_],1).
        maximPoz(E,[H|T],M):-
            E<>H,
            !,
            maximPoz(E,T,M1),
            M=M1+1.
        maximPoz(E,[H|T],M):-
           E=H,
           !,
           maximPoz(E,T,M1),
           M=M1+1.
       run(L,P):-
          maxim(L,Max),
          findall(Poz,maximPoz(Max,L,Poz),P).