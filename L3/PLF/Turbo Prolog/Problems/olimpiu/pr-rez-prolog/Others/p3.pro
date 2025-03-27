
domains
  el=symbol
  arbore=arb(el,arbore,arbore);nil

predicates
  adancime(arbore, integer)
  max(integer, integer, integer)
clauses
  max(A,B,X):-A>B,X=A.
  max(A,B,X):-A<=B,X=B.
  adancime(nil,0):-!.     
  adancime(arb(R,S,D),X):- adancime(S,XS), 
                           adancime(D,XD),
                           max(XS,XD,P),
                           X=P+1. 