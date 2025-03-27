% Sa se afiseze nodurile unui arbore binar parcurs in 
% preordine

domains
  el=symbol
  arbore=arb(el,arbore,arbore);nil   %domeniul corespunzator arborelui
predicates
  preordine(arbore)
clauses
  preordine(nil).
  preordine(arb(E,S,D)):-write(E),nl,preordine(S),preordine(D).
  
% Apel la executie:
% Goal: preordine(arb(a,arb(b,nil,nil),arb(c,nil,nil))
%       a
%       b
%       c  
    