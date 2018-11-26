/* binary trees implementation */

/* an empty binary tree */
emptyBT():- !.
emptyBT(nil):- !.
emptyBT(bTree(nil,nil,nil)).

/* binary tree where
 * left elements are less or equal than root and
 * right elements are greater than root
 * (we could have flatten the tree and apply partial sums) */
bTree(N, nil, nil):- N \= nil.
bTree(N, bTree(LN,LL,LR), nil):-
  N \== nil,
  N @>= LN,
  bTree(LN,LL,LR),!.
bTree(N, nil, bTree(RN,RL,RR)):-
  N \== nil,
  N @< RN,
  bTree(RN,RL,RR),!.
bTree(N, bTree(LN,LL,LR), bTree(RN,RL,RR)):-
  N \== nil,
  N @>= LN, N @< RN,
  bTree(LN,LL,LR),
  bTree(RN,RL,RR),!.

/* merge two lists (lists:append/3) */
merge_list([], L, L).
merge_list([H|T], L, [H|M]):-
  merge_list(T, L, M).

/* inorder traversal
 * 1- traverse left subtree
 * 2- store node value
 * 3- traverse right subtree */
inorder(nil,[]).
inorder(bTree(N,T1,T2),List):-
  inorder(T1,L1),
  merge_list(L1,[N],T),
  inorder(T2,L2),
  merge_list(T,L2,List).

/* postorder traversal
 * 1- traverse left subtree
 * 2- traverse right subtree
 * 3- store node value */
postorder(nil,[]).
postorder(bTree(N,T1,T2),List):-
  postorder(T1,L1),
  postorder(T2,L2),
  merge_list(Tmp,[N],List),
  merge_list(L1,L2,Tmp),!.

/* preorder traversal
 * 1- store node value
 * 2- traverse left subtree
 * 3- traverse right subtree */
preorder(nil,[]).
preorder(bTree(N,T1,T2),[N|T]):-
  preorder(T1,LT),
  merge_list(LT,RT,T),
  preorder(T2,RT).
