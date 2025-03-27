domains
element=symbol
treetype=tree(element,treetype,treetype);nil

predicates
adanc(treetype,integer)
max(integer,integer,integer)
clauses
max(N,M,N):- N>M.
max(N,M,M):- N<=M.

adanc(nil,0).
adanc(tree(_,S,D),N) :- adanc(S,N1),adanc(D,N2),max(N1,N2,N3),N=N3+1.