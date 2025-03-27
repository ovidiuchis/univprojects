
domains
        nume,facultate=symbol
        an=integer
predicates
	aceeasi_fac(nume,nume)
	student(nume,facultate,an)
clauses
	student("X","Y",2).
	student("Z","Y",3).
	student("W","Y",4).
	aceeasi_fac(X,Y):-
			   student(X,Z,_),
			   student(Y,Z,_),
			   X<>Y. 