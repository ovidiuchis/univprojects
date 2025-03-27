/*Sa se verifice daca un element este membru a
unei liste*/

domains
	elem=integer
	lista=elem*
predicates
	 apare(elem,lista)
clauses
	apare(E,[E|T]):-!.
	apare(E,[_|T]):-apare(E,T).