% esTriángulo(+T)
esTriangulo(tri(A,B,C)) :- A < B+C, B < A+C, C < B+A.

% perímetro(?T,?P)
perimetro(tri(A,B,C),P) :- ground(tri(A,B,C)), esTriangulo(tri(A,B,C)), A+B+C = P. % ground significa que esta definido y no tiene variables libres. 
perimetro(tri(A,B,C),P) :- not(ground(tri(A,B,C))), desde2(3,P), between(0,P,A), S is P-A, between(0,S,B), C is S-B, esTriangulo(tri(A,B,C)).

% triangulo(-T)
triangulo(tri(A,B,C)) :- desde2(1,P), between(0,P,A), S is P-A, between(0,S,B), C is S-B, esTriangulo(tri(A,B,C)).

%o mejor:
triangulos2(T) :- perimetro(T,_).

%desde2(+X,?Y), tal que si Y está instanciada, sea verdadero si Y es mayor o igual que X, y si no lo está genere todos los Y de X en adelante.
desde2(X,X).
desde2(X,Y) :- var(Y), N is X+1, desde2(N,Y). %var(Y) es verdadero si esta instanciada
desde2(X,Y) :- nonvar(Y), X < Y.
