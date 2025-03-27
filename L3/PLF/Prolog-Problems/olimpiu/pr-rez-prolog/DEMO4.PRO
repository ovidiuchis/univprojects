% Se da o lista formata din numere intregi si 
%simbloluri. Se cere suma numerelor ointregi pare
% din lista

domains
  el=i(integer);s(symbol)  %tipul elementului din lista
                            % eterogena
  list=el*
predicates
  suma(list,integer)
clauses
  suma([],0).
  suma([i(N)|T],S):-   %in capul listei e un numar intreg par
                     N mod 2=0,!,suma(T,S1),S=S1+N.
  suma([_|T],S):-suma(T,S).  % in capul listei e fie un
                            % un intreg impar, fie 
                            % un simbol.

% Apel la executie
% Goal: suma([i(1),s(b),i(5),i(6),s(a)],S)
%       S=6                                                                              