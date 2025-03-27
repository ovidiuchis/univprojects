

domains
         element=symbol
         arbore=arb(element,arbore,arbore);nil
predicates
          creaza(element,arbore) %(i,o)
          ins_st(arbore,arbore,arbore) %(i,i,o)
          ins_dr(arbore,arbore,arbore)  %(i,i,o)
          preordine(arbore)
          nr_noduri(integer,arbore,integer) 
clauses
         creaza(R,arb(R,nil,nil)).
         ins_st(S,arb(R,_,D),arb(R,S,D)).
         ins_dr(D,arb(R,S,_),arb(R,S,D)).
         preordine(nil).
         preordine(arb(R,S,D)):-
               write(R),
               nl,
               preordine(S),
               preordine(D). 
         nr_noduri(N,arb(R,S,D),M):-
                   N=N+1,
                   nl,
                   M=N,
                   nr_noduri(N,S,M),
                   nr_noduri(N,D,M).
goal
      creaza("a",A1),creaza("b",A2),
      ins_dr(A1,A2,A),preordine(A),
      nr_noduri(0,A,N),write(N).