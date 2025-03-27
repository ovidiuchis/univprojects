/* predicat care intoarce lungimea listei */
domains
  list=integer*
predicates
  length(list,integer)
clauses
  length([],0).
  length([_|T],L):-
                    length(T,Taill),
                    L=Taill+1.