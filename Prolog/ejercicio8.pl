%borrar(+ListaOriginal, +X, -ListaSinXs)
borrar([], _, []).
borrar([X|Xs], X, Ys) :- borrar(Xs, X, Ys).
borrar([X|Xs], Y, [X|Ys]) :- X \= Y, borrar(Xs, Y, Ys).
    
%intersección(+L1, +L2, -L3)
interseccion([],L2,[]).
interseccion([X|L1],L2,[X|L3]) :- member(X,L2), borrar(X,L1,L4), interseccion(L4,L2,L3).
interseccion([X|L1],L2,L3) :- 	not(member(X,L2)), interseccion(L1,L2,L3).

%sacarDuplicados(+L1, -L2)
sacarDuplicados([],[]).
sacarDuplicados([X|L1],[X|L2]) :- borrar(L1,X,L3), sacarDuplicados(L3,L2).

%eliminarUno(+L,+X,-L2)
eliminarUno([],_,[]).
eliminarUno([X|Xs], X, Xs).
eliminarUno([Y|Xs], X, [Y|Ys]) :- Y\=X, eliminarUno(Xs,X,Ys).

%permutación(+L1, ?L2)
permutacion([],[]).
%instancio un miembro cualquiera de L1, lo meto en L2
permutacion(L1,[X|L2]) :- member(X,L1), eliminarUno(L1,X,L3), permutacion(L3,L2).
