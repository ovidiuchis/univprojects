% Se da o lista formata din simboluri. Se cere al
% n-lea element al listei.
domains
   lista=symbol*
predicates
   run(lista)
   select(lista,integer,symbol)
   tipar(lista,integer)
   length(lista,integer)
clauses
   length([],0):-!.
   length([_|L],M):-length(L,M1),M=M1+1.
   run(L):-write("N="),readint(N),tipar(L,N).
   tipar(L,N):-length(L,M),N>M,write("nu exista element"),nl,!.
   tipar(L,N):-select(L,N,S),write("ELEMENT=",S),nl.
   select([A|L],1,A):-!.
   select([_|L],N,S):-N1=N-1,select(L,N1,S).      
   
% Apel la executie    
% Goal: run ([a,b,c,d])
%       N=2
% se va afisa ELEMENT=b