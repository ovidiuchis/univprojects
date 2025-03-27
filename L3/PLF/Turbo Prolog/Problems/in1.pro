%Sa se construiasca un predicat care obtine lista
%tuturor nodurilor unui arbore binar.Arborele va fi
%parcurs in preordine.
%trace
domains
  el=symbol
  arbore=arb(el,arbore,arbore);nil
  lista=el*
predicates
  getlista(arbore,lista)
  reuneste(lista,lista,lista)
clauses
  reuneste([],L,L):-!.
  reuneste([H|T],L,[H|T2]):-reuneste(T,L,T2).
  getlista(nil,[]):-!.
  getlista(arb(E,S,D),[E|L]):-getlista(S,L1),getlista(D,L2), reuneste(L1,L2,L).
  
         
/*goal
  getlista(arb(a,
                 arb(g,
                        arb(e,nil,nil),
                        arb(d,nil,nil)
                      ),
                  arb(c,                        
                         arb(f,nil,nil),
                         arb(b,nil,nil)
                      )
               ),
            L),
%  getlista(arb(a,arb(b,nil,nil),nil),L),
  write(L).*/
             
                           