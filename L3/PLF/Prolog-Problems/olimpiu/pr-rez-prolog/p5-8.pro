%Se da un numar natural n. Se cere sa se determine
%toate descompunerile lui ca suma de numere natura
%le consecutive. 
predicates
  desc(integer)
  des1(integer,integer)
  des2(integer,integer)
  desc_aux(integer,integer)
clauses
  des1(N,N):-write(N).
  des1(N,Prim):-Prim<N,!,
              Prim1=Prim+1,
              N1=N-Prim,
              des1(N1,Prim1),!,
              write('+',Prim).
  des2(N,M):-des1(N,M),write("\n").
  des2(N,M):-not(des1(N,M)).
  desc_aux(N,I):-I<=N,!,I1=I+1,
                 des2(N,I),
                 desc_aux(N,I1).
  desc_aux(N,I):-I>N.
  desc(N):-desc_aux(N,1).