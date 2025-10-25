juntar([],L1,L1).
juntar([X|L1], L2, [X|L3]) :- juntar(L1,L2,L3).
