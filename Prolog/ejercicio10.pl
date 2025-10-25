%Esto solo funciona si X está instanciado e Y no(porque si le paso un X<Y se cuelga) (+X,-Y)
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

%desde2(+X,?Y), tal que si Y está instanciada, sea verdadero si Y es mayor o igual que X, y si no lo está genere todos los Y de X en adelante.

desde2(X,X).
desde2(X,Y) :- var(Y), N is X+1, desde2(N,Y). %var(Y) es verdadero si esta instanciada
desde2(X,Y) :- nonvar(Y), X < Y.
