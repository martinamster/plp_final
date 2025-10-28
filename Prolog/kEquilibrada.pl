% kEquilibrada(+K,-L)
% tiene que devolver en L todas las listas k-equilibradas.
% una lista es k-equilibrada si cada sublista de tamaño k es distinta y todas juntas dan todas las posibilidades
kEquilibrada(K,L) :- pow(2,K,P), M is P+K-1, generar(M,L), equilibrada(K,L).

% generar(+M,-L)
generar(0,[]).
generar(M,[X|XS]) :- X=1, M>0,N is M-1, generar(N,XS).
generar(M,[X|XS]) :- X=0, M>0,N is M-1, generar(N,XS).

% equilibrada(+K,+L)
equilibrada(K,XS) :- length(XS,K).
equilibrada(K,[X|XS]) :- length(L1,K), append(L1,L2,[X|XS]), noEsta(L1,XS), equilibrada(K,XS). 

% noEsta(+L1, +L2)
noEsta(L,L2) :- not(esSublista(L,L2)).

esSublista(Sub, Lista) :- append(Sub, _, Lista).
esSublista(Sub, [_|Cola]) :- esSublista(Sub, Cola).
