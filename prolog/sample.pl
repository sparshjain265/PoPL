s([]).
s([a]).
s([b]).
s([a|[S|[a]]]) :- s(S).
s([b|[S|[b]]]) :- s(S).
