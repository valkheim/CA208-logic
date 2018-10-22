myElem(X,[X|_]).
myElem(X,[_|T]):-
  myElem(X,T).

myHead(X,[X|_]).

myLast(X,[X]).
myLast(X,[_|T]):-
  myLast(X,T).

myTail(L,L).
myTail(A,[_|Tb]):-
  myTail(A,Tb).
/*
?- myTail([a,b],[c,d,e,a,b]).
true .
*/

myAppendf(A,B,C):-
  flatten([A|B],C).

myAppendc(A,B,C):-
  concat(A,B,C).
