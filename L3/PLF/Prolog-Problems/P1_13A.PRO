/*Sa se scrie un predicat care substituie intr-o
lista un element printr-o alta lista.*/

domains
        elem=integer
        lista=elem*
predicates
          conc(lista,lista,lista)
          subst(lista,elem,lista,lista)
clauses
       conc([],L,L):-!.
       conc([H|T],L,LL):-
         conc(T,L,LL1),
         LL=[H|LL1],
         !.
       subst([],_,_,[]):-!.
       subst([H|T],H,LL,L):-
         subst(T,H,LL,L1),
         conc(LL,L1,L),
         !.
       subst([H|T],X,LL,L):-
         subst(T,X,LL,L1),
         L=[H|L1],
         !.