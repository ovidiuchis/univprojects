domains
 lista=integer*
predicates
 ordon(lista,lista)
 inserez(lista,integer,lista)
 
clauses
 inserez([],X,[X|[]]).
 inserez([H|T],X,[X|[H|T]]):-H>X; H=X.
 inserez([H|T],X,[H|L]):-inserez(T,X,L),
                         X>H.
                         
 ordon([],[]).
 ordon([H|[]],[H|[]]).
 ordon([H|[C|[]]],[H|[C|[]]]):-H<C.
 ordon([H|[C|[]]],[C|[H|[]]]):-H>C; H=C.

 ordon([H|T],L):-ordon(T,L1),
                 !,
                 inserez(L1,H,L).