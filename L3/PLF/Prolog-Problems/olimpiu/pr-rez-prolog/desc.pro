%Se da un numar natural n. Se cere sa se determine
%toate descompunerile lui ca suma de numere prime. 
predicates
  desc(integer)
  des_cons(integer,integer,integer,integer)
  des_consaux(integer,integer,integer,integer)
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
%  des_cons(N,N,_,NN):-prim(N),N<>NN,!,write(N).		
  des_cons(N,N,_,NN):-prim(N),N<>NN,!,write(N).
  des_cons(N,Prim,I,NN):-Prim<N,
  	prim(Prim),
  	Prim=I , N=NN,
  	Prim1 = Prim + 1,
  	N1 = N - Prim,
  	des_cons(N1,Prim1,I,NN),
  	write('+',Prim).
  des_cons(N,Prim,I,NN):-Prim<N,
  	prim(Prim),
  	Prim<>I , N<>NN,
  	Prim1 = Prim + 1,
  	N1 = N - Prim,
  	des_cons(N1,Prim1,I,NN),
  	write('+',Prim).
  	
  des_cons(N,Prim,I,NN):-Prim<N,!,
              Prim1=Prim+1,
              des_cons(N,Prim1,I,NN).
%	      write('+',Prim).
%  des_cons(N,Prim):-
%  	Prim1 = Prim - 1,
%  	des_cons(N,Prim1).       
  des_consaux(N,M,I,NN):-des_cons(N,M,I,NN),write("\n").
  des_consaux(_,_,_,_):-write("Lavi"),nl, 1=1.
  desc_aux(N,I):-I<=N,I1=I+1,
  		 %N3=N-I,	
                 des_consaux(N,I,I,N),
            %     write(I1),nl,
                 desc_aux(N,I1).
  desc_aux(N,I):-I>N.
  desc(N):- 
  	desc_aux(N,2).