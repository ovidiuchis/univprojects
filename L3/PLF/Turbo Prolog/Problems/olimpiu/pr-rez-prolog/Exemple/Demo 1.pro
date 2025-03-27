%Sa se calculeze suma elementelor pare dintr-o lista
%cu elemente numerice.
domains
   lista=integer* %se declara o lista ca o succesiune de numere intregi
predicates
   suma(lista,integer) % se declara predicatul ce calculeaza suma
clauses
   suma([],0):-!. % daca lista este vida, suma este 0. ! - taietura- se ignora restul clauzelor
   suma([A|L],S):- A mod 2=0,suma(L,S1),S=A+S1,!. % daca lista nu este vida, se imparte lista in
   suma([_|L],S):-suma(L,S).  % doua (capul A si coada L) si se iau cele 2 cazuri (A par sau impar)
% Apel la executie:    Goal: suma([1,2,3],S)
% se va afisa solutia  S=2