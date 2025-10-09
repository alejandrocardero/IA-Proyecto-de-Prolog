% Hechos de Generación 1 (Abuelos)
hombre(pedro).
mujer(marta).
padre(pedro, juan).
padre(pedro, ana).
madre(marta, juan).
madre(marta, ana).

% Hechos de Generación 2 (Padres/Hijos)
hombre(juan).
mujer(ana).
hombre(luis). % Esposo de Ana
mujer(maria). % Esposa de Juan

padre(juan, carlos).
padre(juan, laura).
madre(maria, carlos).
madre(maria, laura).

padre(luis, sofia).
madre(ana, sofia).

% Hechos de Generación 3 (Nietos)
hombre(carlos).
mujer(laura).
mujer(sofia).


% REGLAS (Las mismas reglas básicas, ahora más probadas)


% Regla 1: Abuelo (X) es el padre de Y, y Y es padre o madre de Z.
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).
abuelo(X, Z) :- padre(X, Y), madre(Y, Z).

% Regla 2: Hijo (X) es si Y es padre o madre de X.
hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

% Regla EXTRA (Bonus!): Define si X y Y son hermanos (con el mismo padre y madre).
hermano(X, Y) :-
    padre(P, X),       % P es padre de X
    padre(P, Y),       % P es padre de Y
    madre(M, X),       % M es madre de X
    madre(M, Y),       % M es madre de Y
    X \= Y.            % X no es la misma persona que Y (muy importante!)

% Regla EXTRA 2: Bisabuelo (X) es el abuelo del padre/madre de Z.
bisabuelo(X, Z) :- abuelo(X, Y), padre(Y, Z).
bisabuelo(X, Z) :- abuelo(X, Y), madre(Y, Z).