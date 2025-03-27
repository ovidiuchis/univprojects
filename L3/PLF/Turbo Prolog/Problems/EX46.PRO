/*P1.3b)Definiti un predicat care intoarce
cel mai mare divizor comul al numerelor dintr-o lista.*/

domains
	elem=integer
	list=elem*
predicates
	cmmd1(elem,elem,elem)
	cmmd(list,elem)
clauses
	cmmd1(X,0,X):-!.
	cmmd1(0,Y,Y):-!.
	cmmd1(X,Y,Z):-
		X>Y,
		Y1=X-Y,
		cmmd1(Y1,Y,Z),
		!.
	cmmd1(X,Y,Z):-
		X<Y,
		Y1=Y-X,
		cmmd1(X,Y1,Z),
		!.
	cmmd1(X,Y,X):-
		X=Y,
		!.
	cmmd([],0).
	cmmd([H|L],Rez):-
		cmmd(L,Rez1),
		cmmd1(H,Rez1,Rez).