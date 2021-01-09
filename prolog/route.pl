head(X, [X|_]).
last(X, [X]).
last(X, [_|V]) :- last(X, V).

member(X, [X|_]).
member(X, [_|Z]) :- member(X, Z).

before(X, Y, [X|Z]) :- member(Y, Z).
before(X, Y, [_|V]) :- before(X, Y, V).

after(X, Y, Z) :- before(Y, X, Z).

towards(X, Y, R, T) :- after(X, Y, R), head(T, R).
towards(X, Y, R, T) :- before(X, Y, R), last(T, R).

junction(X, R) :- member(U, R), member(V, R), member(X, U), member(X, V).