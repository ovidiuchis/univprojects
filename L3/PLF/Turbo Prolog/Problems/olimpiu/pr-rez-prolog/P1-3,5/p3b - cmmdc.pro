%Definiti un predicat care intoarce cel mai mare divizor comun al numerelor dintr-o lista.
domains
  el=integer
  list=el*
predicates
  cmmdc(list,el)
  cmmdc2nr(el,el,el)
clauses
  cmmdc2nr(X,0,X):-!.
  cmmdc2nr(X,Y,Z):-X>=Y,X-Y=Y1,cmmdc2nr(Y,Y1,Z),!.
  cmmdc2nr(X,Y,Z):-X<Y,cmmdc2nr(Y,X,Z).
  cmmdc([],0).
  cmmdc([H|T],X):-cmmdc(T,X1),cmmdc2nr(X1,H,X).
goal:
  cmmdc([4,4,8,2,6,8,12,3],X).