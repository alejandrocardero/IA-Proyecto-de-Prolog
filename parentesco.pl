% HECHOS (4 Hechos)
padre(juan, maria).
padre(juan, carlos).
padre(carlos, ana).
madre(maria, laura).

% REGLAS (2 Reglas)

% Regla 1: Define al abuelo(X, Z)
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).
abuelo(X, Z) :- padre(X, Y), madre(Y, Z).

% Regla 2: Define si X es un hijo(X, Y)
hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).