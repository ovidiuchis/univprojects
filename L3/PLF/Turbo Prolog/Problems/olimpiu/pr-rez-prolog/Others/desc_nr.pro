%Se da un numar natural n. Se cere sa se determine
%toate descompunerile lui ca suma de numere natura
%le consecutive. 
predicates
  desc(integer)
  des_cons(integer,integer)
  des_consaux(integer,integer)
  desc_aux(integer,integer)
clauses
  des_cons(N,N):-write(N).
  des_cons(N,Prim):-Prim<N,!,
              Prim1=Prim+1,
              N1=N-Prim,
              des_cons(N1,Prim1),!,
              write('+',Prim).
  des_consaux(N,M):-des_cons(N,M),write("\n").
  des_consaux(N,M):-not(des_cons(N,M)).
  desc_aux(N,I):-I<=N,!,I1=I+1,
                 des_consaux(N,I),
                 desc_aux(N,I1).
  desc_aux(N,I):-I>N.
  desc(N):-desc_aux(N,1).