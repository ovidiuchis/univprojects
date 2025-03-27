/* sa se scrie un predicat care substituie un element 
       prin altul in toate nodurile unui arbore binar */
domains
  treetype=tree(integer,treetype,treetype);empty
predicates
  subst(integer,integer,treetype,treetype)
clauses
  subst(_,_,empty,empty).
  subst(X,Y,tree(X,S1,S2),tree(Y,T1,T2)):-
     subst(X,Y,S1,T1),
     subst(X,Y,S2,T2). 
  subst(X,Y,tree(Z,S1,S2),tree(Z,T1,T2)):-
     X<>Z,
     subst(X,Y,S1,T1),
     subst(X,Y,S2,T2). 
     