
domains
         element=symbol
         arbore=arb(element,arbore,arbore);nil
predicates
          creaza(element,arbore) %(i,o)
          ins_st(arbore,arbore,arbore) %(i,i,o)
          ins_dr(arbore,arbore,arbore) %(i,i,o)
          preordine(arbore)    %(i)
          nrnoduri(arbore,integer)     %(i,o)
clauses
          creaza(R,arb(R,nil,nil)).
          ins_st(S,arb(R,_,D),arb(R,S,D)).
          ins_dr(D,arb(R,S,_),arb(R,S,D)).
          nrnoduri(nil,0).
          nrnoduri(arb(_,S,D),N):-
                 nrnoduri(S,M),
                 nrnoduri(D,L),
                 N=M+L+1.
          preordine(nil).
          preordine(arb(R,S,D)):-
               write(R),
               nl,
               preordine(S),
               preordine(D).     
goal
/* ex1     creaza("a",A1),creaza("b",A2),
           creaza("c",A3),
      	   ins_st(A1,A2,A),ins_dr(A,A3,B),
           write("arborele in preordine \n"),
           preordine(B),
           nrnoduri(B,N),write("nr noduri=",N).
 */
         creaza("Ana",A1),creaza("Mihai",A2),
         creaza("Dana",A3),creaza("Ion",A4),
         ins_st(A1,A2,B),ins_dr(B,A3,B2),
         ins_st(B2,A4,ArbFin),
         write("arborele in preordine \n"),
         preordine(ArbFin),
         nrnoduri(ArbFin,N),write("nr noduri=",N).