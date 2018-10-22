/* memoization */
:- use_module(library(tabling)).
:- table fibm/2.

fib(0,1):- !. /* cut not to go < 0 */
fib(1,1):- !.
fib(X,Y):-
  X1 is X-1,
  X2 is X-2,
  fib(X1,Y1),
  fib(X2,Y2),
  Y is Y1 + Y2.

fibm(0,1):- !. /* cut not to go < 0 */
fibm(1,1):- !.
fibm(X,Y):-
  X1 is X-1,
  X2 is X-2,
  fib(X1,Y1),
  fib(X2,Y2),
  Y is Y1 + Y2.
