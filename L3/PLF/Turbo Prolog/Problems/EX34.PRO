/*Se da o lista cu elem.num.diferite. Se cer
aranjamentele cu k elemente avand suma div 3.*/

domains
	elem=integer
	list=elem*
predicates
	apare(elem,list)
	candidat(elem,list)
	subm(list,integer,list)
	subm_aux(list,integer,list,list,integer,integer)
clauses
	apare(E,[E|_]).
	apare(E,[_|T]):-apare(E,T).
	candidat(E,L):-apare(E,L).
	subm(L,K,Ar):-
		subm_aux(L,K,Ar,[],0,0).
	subm_aux(_,K,Ar,Ar,K,S):-
		S mod 3=0,
		!.
	subm_aux(L,K,Ar,Col,Lg,Sum):-
		candidat(E,L),
		not(apare(E,Col)),
		Lg1=Lg+1,
		Sum1=Sum+E,
		subm_aux(L,K,Ar,[E|Col],Lg1,Sum1).