%Se da o lista formata din numere intregi si liste de numere intregi.
%  Se cere ca toate aparitiile elementului maxim (dintre valorile intregi
%  ale listei) sa se inlocuiasca in subliste cu o valoare x data.
%trace
domains
  el=int(integer);lista(list)
  list=el*
  
predicates
  afisare(list)
  afis(list)
  max(integer,list,list)
  punere(integer,integer,el,el)
  pune(integer,integer,list,list)

clauses
%afisez lista toata
  afisare([]):-write("[]"),!.
  afisare(X):-write("[ "),
              afis(X).
  
  afis([lista(H)|T]):-write(" [ "),
                      afis(H),
                      afis(T).
  afis([int(H)|T]):-write(' '),write(H),write(' '),
                    afis(T).
  afis([]):-write(" ] ").

%determin maximul din lista totala  
  max(X,[],Y):- pune(X,0,Y,A),afisare(A).
  max(N,[int(H)|T],Y):-     H>=N,!,max(H,T,Y).
  max(N,[int(H)|T],Y):-     H<N,!,max(N,T,Y).
  max(N,[lista(_)|T],Y):-   max(N,T,Y).
  
%inlocuiesc val maxima cu val data
%integer 1 e maximul,integer 2 e valoarea  

  punere(_,_,lista([]),lista([])):-!.
  punere(X,E,lista([int(H)|T]),lista([int(E)|T1])):-
        X=H,!,
        punere(X,E,lista(T),lista(T1)).
  punere(X,E,lista([H|T]),lista([H|T1])):-
        punere(X,E,lista(T),lista(T1)).
        
  pune(_,_,[],[]):-!.
  pune(X,E,[lista(H)|T],[Y|T1]):-
        punere(X,E,lista(H),Y),
        pune(X,E,T,T1).
  pune(X,E,[int(H)|T],[int(H)|T1]):-
        pune(X,E,T,T1).        

  
goal
  Y=[int(1),lista([int(1),int(3)]),int(6),int(5),
  lista([int(4),int(9)]),int(9),lista([int(2),int(9)
  ,int(3)]),lista([int(9),int(4)]),int(1)],

  max(-10,Y,Y).
  


   