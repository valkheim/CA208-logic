male(john).
male(bob).
male(linus).
male(richard).
male(dennis).
male(brian).
male(donald).
male(foobar).

female(lynn).
female(grace).
female(kelly).
female(ellen).
female(margaret).
female(ada).
female(betty).
female(frances).
female(anita).

/**
 *           lynn---frances      bob---ada
 *                |                  |
 *            +---+---+              |        brian---anita
 *            |       |      +-------+-----+        |
 *            |       |      |             |        |
 *          foobar  john---ellen         kelly---richard
 *                       |                     |
 *     +--------+--------+---------+         linus
 *     |        |        |         |
 *  donald    grace    betty     dennis
**/

parent(lynn, foobar).
parent(lynn, john).
parent(frances, foobar).
parent(frances, john).

parent(bob, ellen).
parent(bob, kelly).
parent(ada, ellen).
parent(ada, kelly).

parent(brian, richard).
parent(anita, richard).

parent(kelly, linus).
parent(richard, linus).

parent(john, donald).
parent(john, grace).
parent(john, betty).
parent(john, dennis).
parent(ellen, donald).
parent(ellen, grace).
parent(ellen, betty).
parent(ellen, dennis).

grandparent(X,Y):-
  parent(X,Z),
  parent(Z,Y).

child(X,Y):-
  parent(Y,X).

father(X,Y):-
  male(X),
  parent(X,Y).

mother(X,Y):-
  female(X),
  parent(X,Y).

ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z), ancestor(Z,Y).

descendant(X,Y) :-
  ancestor(Y,X).

/* duplicates */
sibling(X,Y) :-
  parent(Z,X),
  parent(Z,Y),
  dif(X,Y).

sister(X,Y):-
  female(X),
  sibling(X,Y),
  dif(X,Y).

brother(X,Y):-
  male(X),
  sibling(X,Y),
  dif(X,Y).

uncle(X,Y):-
  brother(X,Z),
  child(Y,Z).

aunt(X,Y):-
  sister(X,Z),
  child(Y,Z).

son(X,Y):-
  male(X),
  child(X,Y).

daughter(X,Y):-
  female(X),
  child(X,Y).

cousin(X,Y):-
  dif(X,Y),
  grandparent(Z,X),
  grandparent(Z,Y),
  not(sibling(X,Y)).
