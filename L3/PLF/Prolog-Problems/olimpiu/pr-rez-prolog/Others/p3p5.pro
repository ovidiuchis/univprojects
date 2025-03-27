domains
	el =  symbol
	arbore = arb(el,arbore,arbore);nil
predicates
	creaza(el,arbore)
	inss(arbore,arbore,arbore)
	insd(arbore,arbore,arbore)
        preordine(arbore)
        i(arbore)
        invers(arbore,arbore)
        
clauses
	creaza(E,arb(E,nil,nil)).
	inss(A,arb(E,_,D),arb(E,A,D)).
	insd(A,arb(E,S,_),arb(E,S,A)).
	
  preordine(nil):- S=nil.
  preordine(nil):- D=nil.
  preordine(arb(R,S,D)):-write(R),
  			preordine(S),
  			preordine(D).	

  i(X):-creaza(a,A),creaza(b,B),creaza(c,C),
              creaza(d,D),creaza(e,E),inss(D,C,C1),
              insd(E,C1,C2),insd(C2,A,A1),inss(B,A1,X). 
              
  invers(arb(R,nil,D),arb(R,D,nil)):-!.
  invers(arb(R,S,nil),arb(R,nil,S)):-!.
  invers(arb(R,nil,nil),arb(R,nil,nil)):-!.
  invers(arb(R,S,D),arb(R,D1,S1)):-invers(D,D1),
     invers(S,S1).
     