%suma elem pare din primele N subliste ale unei liste date
domains
   el=integer
   list=el*
   elem=e(el);ls(list)
   lista=elem*
predicates
   suma(lista,integer,integer)
   sum(list,integer)
   s(lista)
clauses
   suma([],N,0).
   suma([ls(A)|T],N,S):- 
                        write(N),nl,
                        N>0,
                        sum(A,S1),
                        write(S1),nl,
                        suma(T,N1,S2),
                        S=S2+S1,
                        write("Hello"),
                        write(S),nl,
                        N1=N-1,
                        suma(T,N1,S2).
   suma([e(A)|T],N,S):- suma(T,N,S).
   sum([],0):-!.
   sum([H|L],S2):- H mod 2 =0,
                   sum(L,S3),
                   S2=H+S3,!.
   sum([H|L],S2):- 
                   sum(L,S2),!.
   s(LS):-
           write("N="),
           readint(N),
           S=0,
           suma(LS,N,S),
           write("Suma este:",S).