
domains
       elem=integer
       list=elem*
predicates
         inmultire(elem,list,list)
clauses
       
        inmultire(_,[],[]).
        inmultire(1,L,L).
        inmultire(Nr,[H|T],LNou):-
           H1=H*Nr,
           H1<10,
           inmultire(Nr,T,L),
           LNou=[H1|L].
        