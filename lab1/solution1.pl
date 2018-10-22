/* FACTS */

parents(david, george, noreen).
parents(jennifer, george, noreen).
parents(georgejr, george, noreen).
parents(scott, george, noreen).
parents(joanne, george, noreen).
parents(jessica, david, edel).
parents(clara, david, edel).
parents(michael, david, edel).
parents(laura, georgejr, susan).
parents(anna, scott, siobhan).
parents(edel, mick, peggy).
parents(maria, mick, peggy).
parents(assumpta, mick, peggy).
parents(patrick, kevin, maria).
parents(hugh, kevin, maria).
parents(helena, kevin, maria).
parents(roisin, wim, assumpta).


/* Relationships */

father(X, Y) :- parents(Y, X, _).
male(X) :- father(X, _).

mother(X, Y) :- parents(Y, _, X).
female(X) :- mother(X, _).

grandfather(X, Y) :- father(X, Z), father(Z, Y).
grandfather(X, Y) :- father(X, Z), mother(Z, Y).

grandmother(X, Y) :- mother(X, Z), mother(Z, Y).
grandmother(X, Y) :- mother(X, Z), father(Z, Y).

brother(X, Y) :- male(X), father(Z, X), father(Z, Y), X \== Y.

sister(X, Y) :- female(X), father(Z, X), father(Z, Y), X \== Y.

/* New realtionships */

parent(X,Y) :- father(X,Y); mother(X,Y).

uncle(X,Y) :- parent(Z,Y), brother(X,Z), Z \== X.

aunt(X,Y) :- parent(Z,Y), sister(X,Z), Z \== X.

sibling(X,Y) :-  brother(X,Y); sister(X,Y).

cousin(X,Y) :- parent(Z,X), parent(W,Y), sibling(Z,W).

