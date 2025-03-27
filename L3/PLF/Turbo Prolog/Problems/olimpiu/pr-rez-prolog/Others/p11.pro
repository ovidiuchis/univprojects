domains
  tip = integer
  file = fout
predicates
  pronostic(tip)
  afiseaza(tip)
  afiseaza_pariu(tip, tip,tip,tip)
  valabil(tip, tip, tip, tip)
  pariu
  
clauses
  pronostic(3).
  pronostic(10).
  pronostic(2).
  
  afiseaza(10) :-
    write("1 ").
  afiseaza(2) :-
    write("2 ").
  afiseaza(3) :-
    write("X ").
  
  afiseaza_pariu(W, X, Y, Z) :-
    afiseaza(W),
    afiseaza(X),
    afiseaza(Y),
    afiseaza(Z),
    nl.
    
  valabil(W, X, Y, Z) :-
    Z <> 3,
    W * X * Y * Z < 1000.
    
  pariu :-
    pronostic(W),
    pronostic(X),
    pronostic(Y),
    pronostic(Z),
    valabil(W, X, Y, Z),    
    afiseaza_pariu(W, X, Y, Z),
    fail.
  pariu.

goal
  openwrite(fout, "p.out"),
  writedevice(fout),
  pariu,
  writedevice(screen),
  closefile(fout).