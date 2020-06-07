% Gian Lucas Martín Chamorro    - 45191442F
% Irene Vera Barea              - 49775372Z

asignatura(estadistica).
asignatura(algebra).
asignatura(computadors).
asignatura(programacio).
asignatura(fisica).

% Insertar un elemento en una posición de la lista.
insertar(E,L,[E|L]).
insertar(E,[X|Y],[X|Z]):-insertar(E,Y,Z).
% Permutaciones de una lista
permutacion([],[]).
permutacion([X|Y],Z):-permutacion(Y,L),insertar(X,L,Z).

% Genera un horari per un dia genèric
horari([A1,A2,A3,A4,A5]):-
    asignatura(A1),
    asignatura(A2),
    asignatura(A3),
    asignatura(A4),
    asignatura(A5),
    % L is [A1,A2,A3,A4,A5],
    contar(estadistica,[A1,A2,A3,A4,A5],N1),N1=<3,
    contar(algebra,[A1,A2,A3,A4,A5],N2),N2=<3,
    contar(computadors,[A1,A2,A3,A4,A5],N3),N3=<3,
    contar(programacio,[A1,A2,A3,A4,A5],N4),N4=<3,
    contar(fisica,[A1,A2,A3,A4,A5],N5),N5=<3,
    not(tresSeguides(estadistica,[A1,A2,A3,A4,A5])),
    not(tresSeguides(algebra,[A1,A2,A3,A4,A5])),
    not(tresSeguides(computadors,[A1,A2,A3,A4,A5])),
    not(tresSeguides(programacio,[A1,A2,A3,A4,A5])),
    not(tresSeguides(fisica,[A1,A2,A3,A4,A5])).

horariGeneracio:-
    % Lunes
    horari([DL1,DL2,DL3,DL4,DL5]),
    % DL1\=algebra,DL2\=algebra,DL3\=algebra,
    % DL1\=computadors,DL2\=computadors,DL3\=computadors,
    % DL3\=fisica,DL4\=fisica,DL5\=fisica,
    not(member(algebra,[DL1,DL2,DL3])),
    not(member(computadors,[DL1,DL2,DL3])),
    not(member(fisica,[DL3,DL4,DL5])),
    % Martes
    horari([DM1,DM2,DM3,DM4,DM5]),
    % DM1\=algebra,DM2\=algebra,DM3\=algebra,
    % DM1\=computadors,DM2\=computadors,DM3\=computadors,DM4\=computadors,DM5\=computadors,
    % DM1\=programacio,DM2\=programacio,DM3\=programacio,DM4\=programacio,DM5\=programacio,
    % DM2\=fisica,DM3\=fisica,DM4\=fisica,DM5\=fisica,
    not(member(algebra,[DM1,DM2,DM3])), % Álgebra cualquier día a partir de las 18:30.
    not(member(computadors,[DM1,DM2,DM3,DM4,DM5])),
    not(member(programacio,[DM1,DM2,DM3,DM4,DM5])),
    not(member(fisica,[DM2,DM3,DM4,DM5])),
    % Miércoles

    horari([DX1,DX2,DX3,DX4,DX5]),
    % DX1\=algebra,DX2\=algebra,DX3\=algebra,
    % DX1\=computadors,DX2\=computadors,DX3\=computadors,
    % DX3\=fisica,DX4\=fisica,DX5\=fisica,
    
    not(member(algebra,[DX1,DX2,DX3])),
    not(member(computadors,[DX1,DX2,DX3])),
    not(member(fisica,[DX3,DX4,DX5])),

    % Horas semanales

    horasSemanales(estadistica,[[DL1,DL2,DL3,DL4,DL5],[DM1,DM2,DM3,DM4,DM5],[DX1,DX2,DX3,DX4,DX5]]),
    horasSemanales(algebra,[[DL1,DL2,DL3,DL4,DL5],[DM1,DM2,DM3,DM4,DM5],[DX1,DX2,DX3,DX4,DX5]]),
    horasSemanales(computadors,[[DL1,DL2,DL3,DL4,DL5],[DM1,DM2,DM3,DM4,DM5],[DX1,DX2,DX3,DX4,DX5]]),
    horasSemanales(fisica,[[DL1,DL2,DL3,DL4,DL5],[DM1,DM2,DM3,DM4,DM5],[DX1,DX2,DX3,DX4,DX5]]),
    horasSemanales(programacio,[[DL1,DL2,DL3,DL4,DL5],[DM1,DM2,DM3,DM4,DM5],[DX1,DX2,DX3,DX4,DX5]]),
    % write([DL1,DL2,DL3,DL4,DL5]),nl,write([DM1,DM2,DM3,DM4,DM5]),nl,write([DX1,DX2,DX3,DX4,DX5]),nl,nl,
   	comptador(Com),
	Com1 is Com+1,
	retract(comptador(_)),
	asserta(comptador(Com1)),
    fail.

horari:-retractall(comptador(_)),asserta(comptador(0)),horariGeneracio.
horari:-comptador(X),nl,nl,write("En total hi ha "),write(X),write(" solucions").

horasDiarias(_,[],0).
horasDiarias(X,[X|L],N):-!,horasDiarias(X,L,N1),N is N1+1.
horasDiarias(X,[_|L],N):-horasDiarias(X,L,N).
 
horasSemanales(X,[L1,L2,L3]):-
    contar(X,L1,N1),contar(X,L2,N2),contar(X,L3,N3),
    3 is N1+N2+N3.

% Para asegurar que una asignatura no tiene 3 horas seguidas en un mismo día.
tresSeguides(X,[X,X,X|_]).
tresSeguides(X,[_|L]):-tresSeguides(X,L).

contar(_,[],0).
contar(X,[X|L],N):-!,contar(X,L,N1),N is N1+1.
contar(X,[_|L],N):-contar(X,L,N).


% Comença la cerca de solucions
% horari:-.

/*  X -Lunes, martes y miércoles. 5 hores al día.
    X -3 horas de clase semanales.
    X -Una asignatura no puede hacerse durante 3h seguidas, pero sí 3h un mismo día.
    X -Estadística puede ser cualquier hora.
    X -Algébra cualquier día a partir de las 18:30.
    X -Computadores lunes y miércoles a partir de las 18:30.
    X -Programación lunes y miércoles a cualquier hora.
    X -Física no puede más tarde de las 17:30, excepto los martes, que no puede a partir de las 16:30.
*/

/*write, nl, fail
    tell(), told. resultats.txt Nº total de horarios.
*/