generarRompecabezas(S,R) :- grl(S,L), permutacion(L,R).


%eliminarUno(+L,+X,-L2)
eliminarUno([],_,[]).
eliminarUno([X|Xs], X, Xs).
eliminarUno([Y|Xs], X, [Y|Ys]) :- Y\=X, eliminarUno(Xs,X,Ys).

%permutación(+L1, ?L2)
permutacion([],[]).
%instancio un miembro cualquiera de L1, lo meto en L2
permutacion(L1,[X|L2]) :- member(X,L1), eliminarUno(L1,X,L3), permutacion(L3,L2).

grl(L,[L]) :- length(L,N), N>1.
grl(L,[L1|LL]) :- length(L,N), N > 1,between(2,N,P), append(L1,L2,L), length(L1,P), append(_,[X],L1), append([X],L2,L3),grl(L3,LL).


