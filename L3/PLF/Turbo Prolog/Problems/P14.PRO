
domains
      elem=integer
      lista=elem*
predicates
       elimin(elem,lista,lista)
clauses
       elimin(E,[],[]).
       elimin(E,L,[E|L]):-
         elimin(E,L,X).