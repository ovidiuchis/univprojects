domains
     elem=integer
     arbore=arb(elem,arbore,arbore);nil
predicates
     echilibrat(arbore)
     nr_frunze(arbore,integer)
clauses
     nr_frunze(nil,0).
     nr_frunze(arb(_,nil,nil),1).
     nr_frunze(arb(_,A,B),Nr):-nr_Frunze(A,X),
                               
                                 Nr_Frunze(B,Y),
                                 !,
                                 Nr=X+Y+1.
     echilibrat(nil).
     echilibrat(arb(_,A,B)):-nr_frunze(A,X),
                             nr_frunze(B,Y),
                             X=Y.
                