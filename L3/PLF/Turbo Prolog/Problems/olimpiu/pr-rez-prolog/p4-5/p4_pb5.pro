%Se da o lista formata din numere intregi si liste de numere intregi.
%Se cere ca in fiecare sublista sa se dubleze toate elementele pare.
domains
  el=int(integer);lista(list)
  list=el*
predicates
  par(el)
  afisare(list)
  afis(list)
  dublare(el,el)
  subdublare(list,list)
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
  par(int(X)):-X mod 2=0.
  dublare(lista([]),lista([])):-!.
  dublare(lista([H|T]),lista([H|[H|T1]])):-par(H),!,dublare(lista(T),lista(T1)).
  dublare(lista([H|T]),lista([H|T1])):-dublare(lista(T),lista(T1)).  
  subdublare([],[]):-!.
  subdublare([lista(H)|T],[Y|T1]):-dublare(lista(H),Y),subdublare(T,T1).
  subdublare([int(H)|T],[int(H)|T1]):-subdublare(T,T1).
goal
  Y=[int(1),lista([int(1),int(3)]),int(6),int(5),lista([int(4),int(4)]),int(9),
    lista([int(2),int(7),int(3)]),lista([int(1),int(4)]),int(1)],
  afisare(Y),nl,
  subdublare(Y,X),
  afisare(X),nl.
