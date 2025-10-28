%esTautologia(+F)
esTautologia(F) :- not(eval(F,V,f)).



eval(prop(X),V,t) :- nth1(X,V,t).
eval(prop(X),V,f) :- nth1(X,V,f).

eval(neg(X),V,t) :- eval(X,V,f).
eval(neg(X),V,f) :- eval(X,V,t).

eval(or(X,Y),V,t) :- eval(X,V,t).
eval(or(X,Y),V,t) :- eval(Y,V,t).
eval(or(X,Y),V,f) :- eval(X,V,f), eval(Y,V,f).

eval(and(X,Y),V,t) :- eval(X,V,t), eval(Y,V,t).
eval(and(X,Y),V,f) :- eval(X,V,f).
eval(and(X,Y),V,f) :- eval(Y,V,f).

eval(imp(X,Y),V,t) :- eval(X,V,f).
eval(imp(X,Y),V,t) :- eval(Y,V,t).
eval(imp(X,Y),V,f) :- eval(X,V,t), eval(Y,V,f). 

