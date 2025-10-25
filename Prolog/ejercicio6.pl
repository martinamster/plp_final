% aplanar(+Xs, -Ys)
aplanar([], []).
%caso: si x es lista: 
aplanar([X|L2],L3) :- aplanar(X,A), aplanar(L2, B), append(A,B,L3).
% Caso: en la cabeza hay algo que no es una lista.
aplanar([X|L2], L3) :-
    not(aplanar(X, _)),     % Si X no se puede aplanar entonces no es una lista.
    aplanar(L2, B),        
    append([X], B, L3).
