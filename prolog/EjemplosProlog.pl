/* Maestr�a en Ciencias de la Computaci�n
   Lenguajes de programaci�n
    
   Diversos programas en Prolog
*/
   

% Obtiene el m�ximo de dos n�meros:


maximo( X, Y, X ) :- X >= Y.
maximo( X, Y, Y ) :- X < Y.

mayor( X, Y, X ) :- X >= Y,!.
mayor( X, Y, Y ) :- X < Y.

max( X, Y, Y ) :- X < Y, !.
max( X, _, X ) .

% Calcula Y = (X + 3) * 2:

sumar_3_y_duplicar( X, Y ) :- Y is (X+3) * 2.

% calcula Y = (10+3) *2:

suma_10_y_3_por_2( Y ) :- Y is (10+3) * 2.

% calcula el factorial de un n�mero:

% factorial(0, 1).
factorial(0, 1):- !.
factorial(N, F) :- N>0, N1 is N - 1, factorial(N1, F1), F is N * F1.

% Obtiene el incrmento de N en 1 en M:

incre( N, M ) :- M is N + 1.

%fib 0 = 1
%fib 1 = 1
%fib n | n > 1 = fib (n-2) + fib (n-1)

% Obtiene en n-�simo t�rmino de la serie de fibonacci en M:

fib( 1, 0 ):-!.
fib( 2, 1 ):-!.
fib( N, M ) :- N > 1, N1 is N - 1, N2 is N - 2, fib( N1, M1), fib( N2, M2), M is M1 + M2.

% Obtiene X a la N igual a M:

potencia( 0, 0, 'No se puede calcular' ):- !.
potencia( X, 0, 1 ):- X =\=0, !.
potencia( X, N, M ) :- N > 0, N1 is N - 1, potencia( X, N1, M1 ), M is X * M1.

% Lee un n�mero:

lee_numero( X ) :- write( 'Introduce un n�mero: '),
                 nl,
                 read( X ).

% Calcula y escribe el cuadrado de X:

escr_cuadrado( X ) :- X2 is X*X,
                    write( 'El cuadrado de '), 
                    write(X),
                    write( ' es '),
                    write(X2).

% Lee y escribe el cuadrado de un n�mero:

cuadrado :- lee_numero(X), escr_cuadrado(X).