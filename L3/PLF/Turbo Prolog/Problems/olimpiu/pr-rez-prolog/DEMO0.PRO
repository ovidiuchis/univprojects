% calcul factorial 
% modele de flux (i,o) si (i,i)

predicates
  factorial(integer,integer)
clauses
  factorial(0,1):-!.
  factorial(N,F):-N1=N-1,factorial(N1,F1),F=N*F1.
  
% Goal: factorial(5,F)
% F=120
% 1 Solution

% Goal: factorial(5,120)
% Yes
    