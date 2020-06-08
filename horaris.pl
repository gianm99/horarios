% Gian Lucas Martín Chamorro    - 45191442F
% Irene Vera Barea              - 49775372Z

% Assignatures
assignatura(estadistica).
assignatura(algebra).
assignatura(computadors).
assignatura(programacio).
assignatura(fisica).

% Genera un horari per un dia genèric que compleix la restricció de que cap 
% assignatura pot tenir 3 hores o més seguides.
horari([A1,A2,A3,A4,A5]):-
    assignatura(A1),
    assignatura(A2),
    assignatura(A3),
    assignatura(A4),
    assignatura(A5),
    horesDiaries([A1,A2,A3,A4,A5]).

% Genera un horari per la setmana que compleix les restriccions de tots els 
% profesors i on cap assignatura té més de 3 hores setmanals.
horariGeneracio:-
    % Dimarts
    horari([DM1,DM2,DM3,DM4,DM5]),
    % computadors no es pot fer els dimarts
    not(member(computadors,[DM1,DM2,DM3,DM4,DM5])),
    % programació no es pot fer els dimarts
    not(member(programacio,[DM1,DM2,DM3,DM4,DM5])),
    % els dimarts, física no pot ser abans de la segona hora (16:30h)
    not(member(fisica,[DM2,DM3,DM4,DM5])),
    % altre manera d'interpretar l'enunciat:
    % not(member(fisica,[DM3,DM4,DM5])),
    % àlgebra pot a partir de la quarta hora (18:30h)
    not(member(algebra,[DM1,DM2,DM3])),

    % Dilluns
    horari([DL1,DL2,DL3,DL4,DL5]),
    % àlgebra pot a partir de la quarta hora (18:30)
    not(member(algebra,[DL1,DL2,DL3])),
    % els dilluns, computadors ha de ser a partir de la quarta hora (18:30)
    not(member(computadors,[DL1,DL2,DL3])),
    % els dilluns, física no pot ser abans de la tercera hora (17:30)
    not(member(fisica,[DL3,DL4,DL5])),
    % altre manera d'interpretar l'enunciat:
    % not(member(fisica,[DL4,DL5])),

    % Dimecres
    horari([DX1,DX2,DX3,DX4,DX5]),
    % àlgebra pot a partir de la quarta hora (18:30h)
    not(member(algebra,[DX1,DX2,DX3])),
    % els dimecres, computadors ha de ser a partir de la quarta hora (18:30)
    not(member(computadors,[DX1,DX2,DX3])),
    % dimecres, física no pot ser abans de la tercera hora (17:30)
    not(member(fisica,[DX3,DX4,DX5])),
    % altre manera d'interpretar l'enunciat:
    % not(member(fisica,[DX4,DX5])),

    % Hores setmanals
    horesSetmanals([[DL1,DL2,DL3,DL4,DL5],[DM1,DM2,DM3,DM4,DM5],[DX1,DX2,DX3,DX4,DX5]]),
    write([DL1,DL2,DL3,DL4,DL5]),nl,
    write([DM1,DM2,DM3,DM4,DM5]),nl,
    write([DX1,DX2,DX3,DX4,DX5]),nl,nl,
   	comptador(Com),
	Com1 is Com+1,
	retract(comptador(_)),
	asserta(comptador(Com1)),
    fail.

% Per guardar els resultats a un arxiu i el nombre total de solucions
horari:-retractall(comptador(_)),asserta(comptador(0)),
    tell('resultats.txt'),horariGeneracio.
horari:-comptador(X),nl,nl,write("En total hi ha "),write(X),write(" solucions"),told,
    write("En total hi ha "),write(X),write(" solucions").

% Per comprovar les restriccions de l'horari d'un dia
horesDiaries(L):-
    %cap assignatura pot tenir 3 hores seguides
    not(tresSeguides(L,estadistica)),
    not(tresSeguides(L,algebra)),
    not(tresSeguides(L,computadors)),
    not(tresSeguides(L,programacio)),
    not(tresSeguides(L,fisica)).

% Per comprovar que cap assignatura es fa més de 3 hores a la setmana
horesSetmanals([L1,L2,L3]):-
    comptar(L1,NF1,fisica),comptar(L2,NF2,fisica),comptar(L3,NF3,fisica),
    3 is NF1+NF2+NF3,
    comptar(L1,NC1,computadors),comptar(L2,NC2,computadors),comptar(L3,NC3,computadors),
    3 is NC1+NC2+NC3,
    comptar(L1,NP1,programacio),comptar(L2,NP2,programacio),comptar(L3,NP3,programacio),
    3 is NP1+NP2+NP3,
    comptar(L1,NE1,estadistica),comptar(L2,NE2,estadistica),comptar(L3,NE3,estadistica),
    3 is NE1+NE2+NE3.

% Per a assegurar que una assignatura no té 3 hores seguides en un mateix dia
tresSeguides([X,X,X|_],X).
tresSeguides([_|L],X):-tresSeguides(L,X).

% Per comptar el nombre d'aparicions d'un element a una llista
comptar([],0,_).
comptar([X|L],N,X):-!,comptar(L,N1,X),N is N1+1.
comptar([_|L],N,X):-comptar(L,N,X).