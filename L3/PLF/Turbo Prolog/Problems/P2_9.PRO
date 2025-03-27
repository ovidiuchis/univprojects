/*Sa se interclaseze cu pastrerea dublurilor
doua liste sortate.*/

domains
       elem=integer
       list=elem*
predicates
          inter(list,list,list)
clauses
       inter([],L2,L2):-!.
       inter(L1,[],L1):-!.
       inter([H1|T1],[H2|T2],L3):-
          H1<=H2,
          inter(T1,[H2|T2],Lnou),
          L3=[H1|Lnou],
          !.
        inter([H1|T1],[H2|T2],L3):-
           H1>H2,
           inter([H1|T1],T2,Lnou),
           L3=[H2|Lnou],
           !.