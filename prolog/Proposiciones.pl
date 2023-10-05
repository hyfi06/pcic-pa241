% Proposiciones simples en Prolog

% Hechos:

a.
b.
c.
d.
e :- fail.

% Reglas:

x :- a, b, c, d.
k :- a, b.
y :- b, \+ e, a.
z :- f, g, h.
w :- e, c, d.

m :- c, ( e ; a), d.
n :- c, ( \+ a; \+ e ), d.
o :- c, \+ a, d.