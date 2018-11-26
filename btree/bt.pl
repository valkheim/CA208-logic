/* binary trees implementation */
emptyBT():- !.
emptyBT(nil):- !.
emptyBT(bTree(nil,nil,nil)).

isNode(bTree(_,_,_)):- !.

isValidNode(bTree(N,L,R)):-
  isNode(bTree(N,L,R)),
  not(emptyBT(bTree(N,L,R))),
  N \= nil.

/*trace, bTree(bTree(nil,1,nil),2,bTree(nil,3,bTree(nil,5,nil))).*/
/*bTree(bTree(nil,1,nil),2,bTree(bTree(nil,3,nil),3,bTree(nil,5,nil))).*/

/*bTree(bTree(bTree(nil,0,nil),1,nil),2,bTree(nil,3,nil)).*/
/*bTree(bTree(bTree(nil,0,nil),1,bTree(nil,2,nil)),2,bTree(nil,3,nil)).*/
bTree(nil, N, nil).
bTree(bTree(LL,LN,LR), N, nil):-
  N @>= LN,
  bTree(LL,LN,LR),!.
bTree(nil, N, bTree(RL,RN,RR)):-
  N @< RN,
  bTree(RL,RN,RR),!.
bTree(bTree(LL,LN,LR), N, bTree(RL,RN,RR)):-
  N @>= LN, N @< RN,
  bTree(LL,LN,LR),
  bTree(RL,RN,RR),!.
/*
bTree(bTree(bTree(LL,LN,LR), N, nil)):-
  N @> LN.
bTree(bTree(nil, N, bTree(RL, RN, RR))):-
  N @< RN.
bTree(bTree(LL,LN,LR), N, bTree(RL,RN,RR)):-
  N @>= LN, N @< RN,
  bTree(LL,LN,LR),
  bTree(RL,RN,RR).
*/

/*
tree(bTree(_,nil,nil)).
tree(bTree(N,Left,nil)) :- Left@=<N.
tree(bTree(N,nil,Right)) :- N@<Right.
tree(bTree(_,Left,Right)) :- tree(Left), tree(Right).
tree(bTree(N,Left,Right)) :- Left@=<N, N@<Right.
*/

/*
bTree(N,T1,T2):- tree(bTree(N,T1,T2)).
tree(bTree(_,nil,nil)).
tree(bTree(N,T1,nil)):-
  N @>= T1.
tree(bTree(N,nil,T2)):-
  N @< T2.
tree(bTree(_,T1,T2)):-
  tree(T1),
  tree(T2).
tree(bTree(N,T1,T2)):-
  N @>= T1,
  N @< T2.
*/

/*
bTree(_,nil,nil).
bTree(N,T1,nil):-
  T1 @=< N.
bTree(N,nil,T2):-
  N @< T2.
bTree(N,T1,T2):-
  T1 @=< N,
  N @< T2.
bTree(N, _, bTree(RN,_RL,_RR)):-
  RN @> N, !.
bTree(N, bTree(LN,_LL,_LR), _):-
  LN @=< N, !.
  */

 /*
bTree(N,T1,T2):-
  sorted(L, bTree(N,T1,T2), N),
  ordered(L), !.

ordered([]).
ordered([_]).
ordered([X,Y|Z]):-
  X @=< Y,
  ordered([Y|Z]).


list_empty(List):- nth0(0, List, _).
head([H|_],H).

sorted([],nil,_).
sorted(List,bTree(C,L,R),O):-
  format('O ~w ~n',O),
  sorted(L1,L,C),
  (not(list_empty(L1)) , (head(L1,H), writeln(H))),
  append(L1,[C],Tmp),
  sorted(L2,R,C),
  append(Tmp,L2,List).

inorder(bTree(_,L,_), X):- inorder(L,X).
inorder(bTree(X,_,_), X).
inorder(bTree(_,_,R), X):- inorder(R,X).
*/
