%12. Un arbore binar se memoreaza in PROLOG folosind
% urmatoarele declaratii de domenii:
%      element = symbol
%      arbore  = arb(element, arbore, arbore); nil
%   Sa se construiasca un predicat care sa indice 
% calea de la radacina unui arbore binar la un 
% anumit nod.

domains
    element=symbol
%   list=element*
    arbore=arb(element,arbore,arbore); nil 
predicates
    preordine(arbore,element)
clauses
    preordine(nil,e).
    preordine(arb(e,S,D),e):-R=e.
    preordine(arb(R,S,D),e):-write(R),
                    preordine(S,e),preordine(D,e).  
goal 
 preordine(arb(1,
      arb(2,nil,nil),
      arb(3,
         arb(4,nil,nil),
         arb(5,nil,nil)
         )
      ),5)
% preordine(L,5)             
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
         