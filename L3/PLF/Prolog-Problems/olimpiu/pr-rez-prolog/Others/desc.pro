%Se da un numar natural n. Se cere sa se determine
%toate descompunerile lui ca suma de numere prime. 
predicates
  desc(integer)
  des_cons(integer,integer)
  des_consaux(integer,integer)
  desc_aux(integer,integer)
  e_prim(integer,integer)
  prim(integer)
clauses
  	e_prim(_,1):-!.	
	e_prim(N,M):-
		M>=2,
		N mod M <> 0,
		!,
		M1 = M - 1,
		e_prim(N,M1).
	prim(N):-
		N >= 2,
		!,
		N1 = N - 1,
		e_prim(N,N1).			
  des_cons(N,N):-prim(N),!,write(N).
  des_cons(N,Prim):-
  	prim(Prim),
  	Prim1 = Prim + 1,
  	N1 = N - Prim,
  	des_cons(N1,Prim1),!,
  	write('+',Prim).
  des_cons(N,Prim):-Prim<=N,!,
              Prim1=Prim+1,
              des_cons(N,Prim1).
%	      write('+',Prim).
%  des_cons(N,Prim):-
%  	Prim1 = Prim - 1,
%  	des_cons(N,Prim1).       
  des_consaux(N,M):-des_cons(N,M),write("\n").
  des_consaux(N,M):-not(des_cons(N,M)).
  desc_aux(N,I):-I<=N,!,I1=I+1,
                 des_consaux(N,I),
                 desc_aux(N,I1).
  desc_aux(N,I):-I>N.
  desc(N):-
  	%N1 = N -1,
  	desc_aux(N,1).