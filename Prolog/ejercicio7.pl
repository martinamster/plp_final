reverse([], []).
reverse([X|L], P) :- reverse(L, R), append(R, [X], P). %recordar que la coma es un and

%palindromo(+L, ?L1)
palindromo(L,L1) :- reverse(L,R), append(L,R,L1).

%iesimo(?I, +L, -X)
iesimo(I,L,X) :- append(L1,[X|L2],L), I2 is I-1,length(L1,I2).
