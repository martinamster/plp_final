% inorder(+AB,-Lista)
inorder(nil, []).
inorder(bin(I,X,D),L) :- inorder(I,LI), inorder(D,LD), append(LI,[X|LD], L).

% arbolConInorder(+Lista,-AB)
arbolConInorder([],nil).
arbolConInorder(L,bin(I,X,D)) :- append(L1,[X|L2], L), arbolConInorder(L1,I), arbolConInorder(L2,D).

% esABB(+AB)
esABB(T) :- inorder(T,L), msort(L,O), O=L. %porque sort elimina duplicados. Lo hice asi por que sort(+L,-O).



arbol(
  bin(
    bin(
      bin(nil, a, nil),   % izquierda de b
      b,
      bin(nil, c, nil)    % derecha de b
    ),
    d,
    bin(nil, e, nil)      % derecha de d
  )
).
