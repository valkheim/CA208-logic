/******************************/
/* Charles PAULET             */
/* 18103197                   */
/* bt.pl                      */
/* Binary tree implementation */
/******************************/

/* an empty binary tree */
emptyBT():- !.
emptyBT(nil):- !.
emptyBT(bTree(nil,nil,nil)).

/* binary tree where
 * left elements are less or equal than root and
 * right elements are greater than root
 * (we could have flatten the tree and apply partial sums) */
bTree(N, nil, nil):- N \= nil.
bTree(N, bTree(LN,LL,LR), nil):- /* left subtree only */
  N \== nil,
  N @>= LN,
  bTree(LN,LL,LR),!.
bTree(N, nil, bTree(RN,RL,RR)):- /* right subtree only */
  N \== nil,
  N @< RN,
  bTree(RN,RL,RR),!.
bTree(N, bTree(LN,LL,LR), bTree(RN,RL,RR)):- /* subtrees */
  N \== nil,
  N @>= LN, N @< RN,
  bTree(LN,LL,LR),
  bTree(RN,RL,RR),!.

/* merge two lists (lists:append/3) */
merge_list([],L,L).
merge_list([H|T],L,[H|M]):-
  merge_list(T,L,M).

/* inorder traversal
 * 1- traverse left subtree
 * 2- store node value
 * 3- traverse right subtree */
inorder(T,L):-inorder_(T,L),!.
inorder_(nil,[]).
inorder_(bTree(N,T1,T2),List):-
  inorder_(T1,L1),
  merge_list(L1,[N],T),
  inorder_(T2,L2),
  merge_list(T,L2,List).

/* postorder traversal
 * 1- traverse left subtree
 * 2- traverse right subtree
 * 3- store node value */
postorder(T,L):-postorder_(T,L),!.
postorder_(nil,[]).
postorder_(bTree(N,T1,T2),List):-
  postorder_(T1,L1),
  postorder_(T2,L2),
  merge_list(Tmp,[N],List),
  merge_list(L1,L2,Tmp),!.

/* preorder traversal
 * 1- store node value
 * 2- traverse left subtree
 * 3- traverse right subtree */
preorder(T,L):-preorder_(T,L),!.
preorder_(nil,[]).
preorder_(bTree(N,T1,T2),[N|T]):-
  preorder_(T1,LT),
  merge_list(LT,RT,T),
  preorder_(T2,RT).

/* search in tree
 * 1- matching node value and I
 * 2- traverse left subtree
 * 3- traverse right subtree */
search(T,I):- search_(T, I),!.
search_(bTree(I,_,_),I):-!.
search_(bTree(_,LL,_),I):-
  search(LL,I).
search_(bTree(_,_,LR),I):-
  search(LR,I).

/* M is the max between A and B
 * 1- if A @< B, return B
 * 2- else, return A */
max(A,B,M):- (A @< B, M = B, !) ; M = A.

/* tree height
 * 1- traverse left subtree up counting roots in H1
 * 2- traverse right subtree up counting roots in H2
 * 3- H is the max between H1 and H2 */
height(T,H):-height_(T,H),!.
height_(nil,0).
height_(bTree(nil,_,_),0):-!.
height_(bTree(_,nil,nil),1):-!.
height_(bTree(_,LL,LR),H):-
  height_(LL,H1),
  height_(LR,H2),
  max(H1,H2,M),
  H is 1 + M.

/* insert new node in tree
 * 1- find parent node (traverse (left|right) subtrees)
 * 2- match insert with new node */
insert(I,T1,T2):-insert_(I,T1,T2),!.
insert_(nil,I,bTree(I,nil,nil)):-!. /* new node */
insert_(I,bTree(I,T1,T2),bTree(I,T1,T2)).
insert_(I,bTree(N,T1,T2),bTree(N,NL,T2)):-
  I @=< N,
  insert_(T1,I,NL). /* insert at left */
insert_(I,bTree(N,T1,T2),bTree(N,T1,NR)):-
  I @> N,
  insert_(T2,I,NR). /* insert at right */
