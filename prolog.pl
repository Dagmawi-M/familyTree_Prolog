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

