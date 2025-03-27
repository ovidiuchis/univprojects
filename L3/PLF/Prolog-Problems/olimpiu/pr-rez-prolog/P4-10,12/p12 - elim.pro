%Se da o lista formata din numere intregi si liste de numere intregi.
%Se cere sa se elimine ultimele N subliste avand lungimea numar par.
domains
  el=int(integer);lista(list)
  list=el*
predicates
  eliminare(list,integer,list)
  elim(list,list)
  par(list,integer)
  ultim(list)
  afisare(list)
  afis(list)
clauses
  afisare([]):-write("[]"),!.
  afisare(X):-write("[ "),
              afis(X).
  afis([lista(H)|T]):-write(" [ "),
                      afis(H),
                      afis(T).
  afis([int(H)|T]):-write(' '),write(H),write(' '),
                    afis(T).
  afis([]):-write(" ] ").
  par([],0):-!.
  par([_|T],X):-par(T,X1),X=X1+1.
  ultim([]).
  ultim([int(_)|T]):-ultim(T).
  ultim([lista(H)|T]):-par(H,V),V mod 2=1,ultim(T).
  elim([],[]):-!.
  elim([int(H)|T],[int(H)|T1]):-elim(T,T1),!.
  elim([lista(H)|T],T1):-par(H,V),V mod 2=0,ultim(T),elim(T,T1),!.
  elim([lista(H)|T],[lista(H)|T1]):-elim(T,T1),!.
  eliminare(L,0,L):-!.
  eliminare(L,N,L2):-N1=N-1,elim(L,L1),eliminare(L1,N1,L2).
goal
  Y=[int(1),lista([int(1),int(3)]),int(6),int(5),lista([int(4),int(4)]),int(9),
  lista([int(2),int(7),int(3)]),lista([int(1),int(4)]),int(1)],
%  Y=[lista([int(1),int(2),int(2)]),int(5),lista([int(1),int(2)])],
  afisare(Y),nl,
  eliminare(Y,2,X),
  afisare(X),nl.