domains
l1=integer*
element=i(integer);l(l1);null
lista=element*

predicates
dublare(l1,l1)
dublu(lista,lista)

clauses
dublare([],[]).
dublare([H|T],[H|T1]) :- H MOD 2 = 1,dublare(T,T1).
dublare([H|T],[H|[H|T1]]):- H MOD 2 = 0,dublare(T,T1).

dublu([],[]).
dublu([i(H)|T],[i(H)|T1]) :- dublu(T,T1).
dublu([l(H)|T],[l(H1)|T1]) :- dublare(H,H1),
                               dublu(T,T1).