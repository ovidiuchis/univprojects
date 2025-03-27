/*Dandu-se doua valori naturale n si v, se cere un
predicat care determina permutarile elementelor
1..n,cu proprietatea ca orice doua elmente
consecutive au diferenta in valori absoluta mai
mare sau egala cu v.*/

domains
	elem=integer
	lista=elem*
predicates
	candidat(elem,elem)
	permut(elem,elem,lista)
	perm(elem,elem,lista,lista,elem)
	member(elem,lista)
clauses
	member(E,[E|_]):-!.
	member(E,[_|T]):-
		member(E,T).
	candidat(N,N).
	candidat(N,I):-
		N>1,
		N1=N-1,
		candidat(N1,I).
	perm(N,V,L,L,M):-
		N=M,
		!.
	perm(N,V,[A|L],T1,M):-
		candidat(N,I),
		abs(A-I)>=V,
		not(member(I,L)),
		T=[I|[A|L]],
		M1=M+1,
		perm(N,V,T,T1,M1).
	permut(N,V,L):-
		candidat(N,I),
		perm(N,V,[I],L,1).
	