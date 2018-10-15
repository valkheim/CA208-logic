cell(a, 0, 0).
cell(b, 1, 0).
cell(c, 2, 0).
cell(d, 3, 0).
cell(e, 4, 0).

cell(f, 0, 1).
cell(g, 1, 1).
cell(h, 2, 1).
cell(i, 3, 1).
cell(j, 4, 1).

cell(k, 0, 2).
cell(l, 1, 2).
cell(m, 2, 2).
cell(n, 3, 2).
cell(o, 4, 2).

cell(p, 0, 3).
cell(q, 1, 3).
cell(r, 2, 3).
cell('s', 3, 3).
cell('t', 3, 3).

grid(Xs):- findall(cell(C,X,Y), cell(C,X,Y), Xs).

get_cell_from_name(N, X) :-
  findall(cell(A,B,C), (cell(A,B,C), A = N), [X]).

east(A, B):- cell(A,X,_), cell(B,X2,_), X2 > X.
/*
?- east(a, b).
true.
*/

east(cell(_,X,_), cell(_,X2,_)):- X2 > X.
/*
?- east(cell(a,0,0), cell(c,2,0)).
true.
*/

south(cell(_,_,Y), cell(_,_,Y2)):- Y2 > Y.
/*
?- south(cell(a,0,0), cell(h,2,1)).
true.
*/

south_east(cell(_,X,Y), cell(_,X2,Y2)):-
  east(cell(_,X,_), cell(_,X2,_)),
  south(cell(_,_,Y), cell(_,_,Y2)).
/*
?- south_east(cell(a,0,0), cell(h,2,1)).
true.
*/

south_of(cell(_,_,Y), Xs):-
  findall(cell(A,B,C), (cell(A,B,C), C > Y), Xs).
/*
?- south_of(cell(k,0,2), Xs).
Xs = [cell(p, 0, 3), cell(q, 1, 3), cell(r, 2, 3), cell(s, 3, 3), cell(t, 3, 3)].
*/
