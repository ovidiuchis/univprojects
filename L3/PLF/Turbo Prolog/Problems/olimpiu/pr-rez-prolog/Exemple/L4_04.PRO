/* definiti un predicat care inverseaza ordinea 
     subarborilor la toate nodurile unui arbore */
domains
  treetype=tree(integer,treetype,treetype);empty
predicates
  invers(treetype,treetype)
clauses
  invers(empty,empty).
  invers(tree(N,X,Y),tree(N,Y1,X1)):-
     invers(X,X1),
     invers(Y,Y1).