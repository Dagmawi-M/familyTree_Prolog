%Dagmawi Mekonnen
%IE9697


:-dynamic female/1.
female(mar). % First gen parents
female(els).
female(mah).
female(elf). % Second gen parents
female(nardos).
female(kidist).
female(fanaye).%wife of 1st gen parents
female(tsehay).%wife of 1st gen parents
female(senait).%wife of 1st gen parents

:-dynamic male/1.
male(kaleab).
male(eyoel).
male(yonas).
male(mek).
male(dag).  /* First gen Kids*/
male(gir).
male(nati).
male(tek).
male(mul).   % Second gen Kids
male(tes).
male(der).

:-dynamic parent_of/2.
parent_of(mul,nardos).
parent_of(mul,kidist).
parent_of(mul,kaleab).
parent_of(tes,eyoel).
parent_of(der,nati).
parent_of(tes,yonas).
parent_of(fanaye,nardos).
parent_of(fanaye,kidist).
parent_of(fanaye,kaleab).
parent_of(senait,eyoel).
parent_of(tsehay,nati).
parent_of(senait,yonas).
parent_of(mek,dag).
parent_of(mek,gir).
parent_of(mek,mah).
parent_of(mar,dag).
parent_of(mar,gir).
parent_of(mar,mah).

parent_of(tek,mul).
parent_of(tek,tes).
parent_of(tek,der).
parent_of(tek,els).
parent_of(elf,mul).
parent_of(elf,tes).
parent_of(elf,der).
parent_of(elf,els).
parent_of(elf,mar).
parent_of(tek,mar).


%RULES
father_of(X,Y):- male(X),parent_of(X,Y).

mother_of(X,Y):- female(X),parent_of(X,Y).

grandfather_of(X,Y) :- male(X), parent_of(X,Z), parent_of(Z,Y).

grandmother_of(X,Y) :- female(X), parent_of(X,Z), parent_of(Z,Y).

grandparent_of(X,Y):- grandfather_of(X,Y).
grandparent_of(X,Y):- grandmother_of(X,Y).

grandchild_of(X,Y):- grandparent_of(Y,X).

brother_of(X,Y) :- male(X), father_of(Z,X),father_of(Z,Y),mother_of(U,X),mother_of(U,Y),not(X=Y).

sister_of(X,Y) :- female(X),father_of(Z,X),father_of(Z,Y),mother_of(U,X),mother_of(U,Y),not(X=Y).  % Z:same father  U:same mother

aunt_of(X,Y):- parent_of(Z,Y),sister_of(X,Z).
uncle_of(X,Y):- parent_of(Z,Y),brother_of(X,Z).

cousin_of(X,Y):- parent_of(Z,X),
    parent_of(U,Y),brother_of(Z,U).
cousin_of(X,Y):- parent_of(Z,X),parent_of(U,Y),sister_of(Z,U).

niece(X,Y):- parent_of(Z,X),brother_of(Z,Y),female(X).
niece(X,Y):- parent_of(Z,X),sister_of(Z,Y),female(X).

nephew(X,Y):- parent_of(Z,X),brother_of(Z,Y),male(X).
nephew(X,Y):-parent_of(Z,X),sister_of(Z,Y),male(X).





addmale :-
    write_ln("Please Write a Male Family Member : "),
    read(A),
    write_ln("********************* "),
    write(A),
    write(" has been added  "),
    writeln("********************* "),
    assertz(male(A)).

addfemale :-
    write_ln("Please Write a Female Family Member "),
    read(A),
    write_ln("********************* "),
    write(A),
    write(" has been added "),
    writeln("********************* "),
    assertz(female(A)).
  %  tell('hello.pl').

addparent :-
    write_ln("Please Write a parent"),
    read(P),
    write_ln("Please Write a child"),
    read(C),
    write_ln("********************* "),
    write(P),
    write(" has been added as a parent of "),write(C),
    writeln("********************* "),
    assertz(parent_of(P,C)).
   % tell('hello.pl').

   removemale :-
    write_ln("Please Write name to be Removed "),
    read(R),
    retract(male(R)).

removefemale :-
    write_ln("Please Write name to be Removed "),
    read(R),
    retract(female(R)).

showall  :-
    write_ln(" Male Family Members "),write_ln(_____________________), listing(male),
    write_ln(" Female Family Members "),write_ln(________________________), listing(female).


switch(X, [Val:Goal|Cases]):-
    ( X=Val ->
        call(Goal)
    ;
        switch(X, Cases)
    ).

entry:-
    write_ln("


		       WELCOME TO THE FAMILY TREE EXCERCISE
				   WITH PROLOG
		***********************************************
		*                      MENU                   *
		*					      *
		*        1. Add a male family member          *
		*        2. Add a female family member        *
		*        3. Add a parent                      *
		*        4. Remove a male family member       *
		*        5. Remove a female family member     *
		*	 6. Show Family Members & Relations   *
		*					      *
		***********************************************

"),


    read(X),
    switch(X,[
           1 : addmale,
           2 : addfemale,
           3 : addparent,
           4 : removemale,
           5 : removefemale,
           6 : showall
            ]).


:- entry.
