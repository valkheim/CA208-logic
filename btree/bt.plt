/* binary trees tests */
:- begin_tests(bt).

:- include(bt).

test(emptyBT):- emptyBT().
test(emptyBT):- emptyBT(nil).
test(emptyBT):- emptyBT(bTree(nil,nil,nil)).

test(singleNode):- bTree(2,bTree(1,nil,nil),bTree(3,nil,nil)).
test(singleNode):- bTree(2,bTree(2,nil,nil),bTree(3,nil,nil)).
test(singleNode):- \+ bTree(2,bTree(1,nil,nil),bTree(2,nil,nil)).

test(leftSubLeftTree):- bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)).
test(leftSubRightTree):- bTree(5,bTree(4,nil,bTree(5,nil,nil)),bTree(8,nil,nil)).
test(rightSubLeftTree):- bTree(5,bTree(4,nil,nil),bTree(8,bTree(7,nil,nil),nil)).
test(rightSubRightTree):- bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))).

test(merge_list):- merge_list([],[],[]).
test(merge_list):- merge_list([1],[],[1]).
test(merge_list):- merge_list([],[1],[1]).
test(merge_list):- merge_list([a],[1],[a,1]).
test(merge_list):- merge_list([a,b,c],[1,2,3],[a,b,c,1,2,3]).

test(inorder):- inorder(bTree(2,bTree(1,nil,nil),bTree(3,nil,nil)), [1,2,3]).
test(inorder):- inorder(bTree(2,bTree(2,nil,nil),bTree(3,nil,nil)), [2,2,3]).
test(inorder):- inorder(bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)), [4,4,5,8]).
test(inorder):- inorder(bTree(5,bTree(4,nil,bTree(5,nil,nil)),bTree(8,nil,nil)), [4,5,5,8]).
test(inorder):- inorder(bTree(5,bTree(4,nil,nil),bTree(8,bTree(7,nil,nil),nil)), [4,5,7,8]).
test(inorder):- inorder(bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))), [4,5,8,9]).

:- end_tests(bt).
