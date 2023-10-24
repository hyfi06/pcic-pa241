es_triangulo(A,B,C) :-
	A + B > C,
	A + C > B,
	B + C > A.

es_equilatero(A,A,A).

es_isoseles(A,A,C) :-
	es_triangulo(A,A,C).

es_isoseles(A,B,A) :-
	es_triangulo(A,B,A).

es_isoseles(A,B,B) :-
	es_triangulo(A,B,B).

triangulo(A,B,C) :-
	\+es_triangulo(A,B,C),
	write("No es posible formar un triángulo."),
	!.

triangulo(A,B,C) :-
	es_equilatero(A,B,C),
	write("Triángulo equilátero."),
	!.

triangulo(A,B,C) :-
	es_isoseles(A,B,C),
	write("Triángulo isósceles."),
	!.

triangulo(A,B,C) :-
	es_triangulo(A,B,C),
	\+es_equilatero(A,B,C),
	\+es_isoseles(A,B,C),
	write("Triángulo escaleno.").
	!.
