/*Intr-o lista L sa se inlocuiasca toate aparitiile
unui element E cu elementele unei liste, L1*/

domains
       elem=integer
       list=elem*
predicates
          inloc(list,elem,list,list) %(i,i,i,o)
          pune(list,list,list)
clauses
        pune([],_,[]):-!.
        pune(L,[],L):-!.
        pune(L1,[A|L2],[A|L3]):-
          pune(L1,L2,L3).
        inloc([],_,_,[]):-!.
        inloc(L,_,[],L):-!.
        inloc([A|L1],E,L2,[A|L3]):-
          A=E,
          inloc(L1,E,L2,L4),
          pune(L4,L2,L3),
          !.
         inloc([A|L1],E,L2,[A|L3]):-
           A<>E,
           inloc(L1,E,L2,L3).