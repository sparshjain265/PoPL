lang(a, l1).
lang(a, l2).
lang(b, l2).
lang(b, l3).
lang(c, l3).

friend(a, b).
friend(b, c).

talk(X, X).
talk(X, Y) :- lang(X, L), lang(Y, L).
talk(X, Y) :- talk(X, Z), talk(Y, Z), X \= Z, Y \= Z.