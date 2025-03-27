/* Problema4:
 a.Sa se scrie un predicat care substituie intr-o lista
 un element prin altul 
 b.Sa se construiasca sublista (lm..ln) a listei
  (l1...lk)
 */
 
domains
       lista=integer*
       elem=integer
predicates
         subst(elem,elem,lista,lista) %(i,i,o,i)
         adaug(elem,lista,lista) %(i,i,o)
         sublista(elem,elem,lista,lista) %(i,i,i,o)
         sub(elem,elem,elem,lista,lista) %(i,i,i,i,o) 
clauses
        subst(_,_,[],[]).
        subst(E1,E2,[E1|L],[E2|L1]):-!,
                        subst(E1,E2,L,L1).
        subst(E1,E2,[H|L],[H|L1]):-!,
                subst(E1,E2,L,L1).                
        adaug(E,[],[E]).
        adaug(E,[A|L],[A|X]):-
               adaug(E,L,X).
        sublista(_,_,[],[]):-!.
        sublista(M,N,_,[]):- 
                      M>N,!.
        sublista(M,N,L,R):-
              M<=N,!,
              sub(1,M,N,L,R).
              
       sub(P,_,N,_,[]):- P>N.
       sub(P,M,N,[_|L],R):-
           P<M,
           P1=P+1,
           sub(P1,M,N,L,R).
      sub(P,M,N,[H|T],[H|R]):-
               P>=M,
               P<=N,
               P1=P+1,
               sub(P1,M,N,T,R).
          
                  
        
        