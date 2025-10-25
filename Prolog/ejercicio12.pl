% vacio(?A)
vacio(nil).

% raiz(+T,?X)
raiz(bin(_,X,_), X). 

maximo(X,Y,X) :- X>Y.
maximo(X,Y,Y) :- Y>=X.

% altura(+T,?X)
altura(nil,0).
altura(bin(I,X,D),H) :- altura(I,HI), altura(D,HD), maximo(HI,HD,HH), HA is HH+1, HA = H.


% altura(+X, ?A) otra forma:
altura2(nil, 0).
altura2(bin(I, _, D), A) :- altura(I, AI), altura(D, AD), A is 1+max(AI, AD).

% cantidadNodos(+T,?X)
cantidadNodos(nil,0).
cantidadNodos(bin(I,X,D),H) :- cantidadNodos(I,HI), cantidadNodos(D,HD), H is HI+HD+1.






% Árbol de altura 5
arbol_altura_5(
  bin(
    bin(
      bin(
        bin(
          bin(nil, a, nil),    % nivel 1
          b,
          nil
        ),
        c,
        nil
      ),
      d,
      nil
    ),
    e,
    bin(
      bin(nil, f, nil),
      g,
      bin(nil, h, nil)
    )
  )
).

