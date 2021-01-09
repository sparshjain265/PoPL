man(socrates).
man(plato).
man(bheema).
man(hanuman).
man(arjun).
man(pandu).
man(kuntibhoj).
man(vyas).
woman(helen).
woman(kunti).
god(indra).
god(vayu).

father(indra, arjun).
father(pandu, arjun).
father(kuntibhoj, kunti).
father(vyas, pandu).
father(vayu, hanuman).
father(vayu, bheema).
father(pandu, bheema).
mother(kunti, arjun).
mother(kunti, bheema).

mortal(X) :- man(X).
mortal(X) :- woman(X).

ancestor(X, Y) :- father(X, Y).
ancestor(X, Y) :- mother(X, Y).
ancestor(X, Y) :- father(X, Z) , ancestor(Z, Y).
ancestor(X, Y) :- mother(X, Z) , ancestor(Z, Y).

half-brother(X, Y) :- man(X), mother(M, X), mother(M, Y).
half-brother(X, Y) :- man(X), father(F, X), father(F, Y).

