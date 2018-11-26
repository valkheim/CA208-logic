/* binary trees implementation */
emptyBT():- !.
emptyBT(nil):- !.
emptyBT(bTree(nil,nil,nil)).

bTree(_, nil, nil).
bTree(N, bTree(LN,LL,LR), nil):-
  N @>= LN,
  bTree(LN,LL,LR),!.
bTree(N, nil, bTree(RN,RL,RR)):-
  N @< RN,
  bTree(RN,RL,RR),!.
bTree(N, bTree(LN,LL,LR), bTree(RN,RL,RR)):-
  N @>= LN, N @< RN,
  bTree(LN,LL,LR),
  bTree(RN,RL,RR),!.

merge_list([], L, L).
merge_list([H|T], L, [H|M]):-
  merge_list(T, L, M).

inorder(nil,[]).
inorder(bTree(C,L,R),List):-
  inorder(L,L1),
  merge_list(L1,[C],Tmp),
  inorder(R,L2),
  merge_list(Tmp,L2,List).
