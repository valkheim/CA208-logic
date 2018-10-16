print([]).
print([H|T]):-
  writeln(H),
  print(T).

print_n_times(0).
print_n_times(N):-
  N > 0,
  N1 is N - 1,
  print_n_times(N1),
  writeln(N).

reverse_print([]).
reverse_print([H|T]):-
  print(T),
  writeln(H).

first_elem([H|_], H).

last_elem([L], L).
last_elem([_|T], L):-
  last_elem(T, L).

print_last([L]):-
  writeln(L).
print_last([_|T]):-
  print_last(T).

/* same as member prolog predicate with inverted parameters */
is_member([X|_], X).
is_member([_|T], X):-
  is_member(T, X).

count_elem([], 0).
count_elem([_|T], N):-
  count_elem(T, N1),
  N is N1 + 1,
  N > 0.

sum([], 0).
sum([H|T], S):-
  sum(T, S1),
  S is S1 + H.

/* nth is true if X is the N-th element of list L */
nth(0, [H|_], H):- !.
nth(N, [_|T], X):-
  N1 is N - 1,
  nth(N1, T, X).

/* occur is true if N is the occurence of X is in the list L */
occur([], _, 0).
occur([X|T], X, N):-
  occur(T,X,N1),
  N is N1+1.
occur([H|T], X, N):-
  H \== X,
  occur(T,X,N).

/* [H1|T1] is a subset of L2 */
subset([],_).
subset([H1|T1], L2):-
  is_member(L2,H1),
  subset(T1,L2).

/* merge list */
merge_list([], L, L).
merge_list([H|T], L, [H|M]):-
  merge_list(T, L, M).
/*
empty first list, copy first list to M
backtrack on pushing first list single elem to M
[trace]  ?- merge_list([1,2],[3,4],M).
   Call: (8) merge_list([1, 2], [3, 4], _19674) ? creep
   Call: (9) merge_list([2], [3, 4], _19924) ? creep
   Call: (10) merge_list([], [3, 4], _19930) ? creep
   Exit: (10) merge_list([], [3, 4], [3, 4]) ? creep
   Exit: (9) merge_list([2], [3, 4], [2, 3, 4]) ? creep
   Exit: (8) merge_list([1, 2], [3, 4], [1, 2, 3, 4]) ? creep
M = [1, 2, 3, 4].
*/

/* insert at last */
append_elem(L, X, A):-
  merge_list(L, [X], A).

/* insert at first */
insert_elem(L, X, A):-
  merge_list([X], L, A).

/* reverse list */
/*
reverse([],[]).
reverse([H|T], L1):-
  reverse(T, T2),
  merge_list(T2, [H], L1).
*/
reverse_list_aux([H|T],Z,Acc):-
  reverse_list_aux(T,Z,[H|Acc]).
reverse_list_aux([],Z,Z).

reverse_list(L, X):- reverse_list_aux(L, X, []).


/* delete */
/* delete at */
