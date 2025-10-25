natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).
/*
Al consultar menorOIgual(0, X) entramos en una ejecución infinita por la primer regla.
X := suc(Y)
Y := suc(Y2)
Y2 := suc(Y3)
...
Intenamos unificar X con un número cada vez más grande: X := suc(suc(suc(...))).
*/
menorOIgual2(X, X) :- natural(X).
menorOIgual2(X, suc(Y)) :- menorOIgual2(X, Y).
