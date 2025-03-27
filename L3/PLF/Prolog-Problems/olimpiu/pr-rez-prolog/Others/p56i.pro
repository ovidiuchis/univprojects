domains
elem=integer
list=elem*
list2=list*

predicates

comb(list,list,integer)
member(list,elem,integer)
goto(list,list,integer)
combinari(list,integer,list2)

clauses

member([H|_],H,1).
member([_|T],M,N) :- member(T,M,N1),N=N1+1.

goto(M,M,0).
goto([_|T],M,N) :- N1=N-1,goto(T,M,N1).

comb(_,[],0).
comb([H|T],[H1|M],N) :- member([H|T],H1,N2),goto([H|T],X,N2),N1=N-1,comb(X,M,N1).

combinari(X,N,L) :-
findall(Y,comb(X,Y,N),L).