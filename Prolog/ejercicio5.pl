%last (?L, ?U).
last(L, U) :- append(_, [U], L).

%reverse(+L,-L1). FALTA HACER LOS ARBOLES!!
reverse([], []).
reverse([X|L], P) :- reverse(L, R), append(R, [X], P). %recordar que la coma es un and

%prefijo(?P, +L)
prefijo(P,L) :- append(P,_,L).

%sufijo(?S, +L)
sufijo(S,L) :- append(_,S,L).

%sublista(?S,+L)
sublista(S,L) :- prefijo(P,L), sufijo(S,P).

%pertenece(?X, +L)
pertenece(X,[X|L]).
pertenece(X,[Y|L]) :- pertenece(X,L).

%otra opcion:
pertenece2(X,L) :- sublista([X],L).
