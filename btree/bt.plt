/* binary trees tests */
:- begin_tests(bt).

:- include(bt).

test(emptyBT):- emptyBT().
test(emptyBT):- emptyBT(nil).
test(emptyBT):- emptyBT(bTree(nil,nil,nil)).

test(singleNode):- bTree(2,bTree(1,nil,nil),bTree(3,nil,nil)).
test(singleNode):- bTree(b,bTree(a,nil,nil),bTree(c,nil,nil)).
test(singleNode):- bTree(2,bTree(2,nil,nil),bTree(3,nil,nil)).
test(singleNode):- \+ bTree(2,bTree(1,nil,nil),bTree(2,nil,nil)).
test(singleNode):- \+ bTree(nil,a,b).

test(leftSubLeftTree):- bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)).
test(leftSubRightTree):- bTree(5,bTree(4,nil,bTree(5,nil,nil)),bTree(8,nil,nil)).
test(rightSubLeftTree):- bTree(5,bTree(4,nil,nil),bTree(8,bTree(7,nil,nil),nil)).
test(rightSubRightTree):- bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))).

test(nilSubTreeRoot):- \+ bTree(5,bTree(nil,nil,nil),bTree(8,nil,bTree(9,nil,nil))).
test(nilSubTreeRoot):- \+ bTree(5,bTree(nil,5,nil),bTree(8,nil,bTree(9,nil,nil))).

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

test(inorder):- inorder(bTree(10, bTree(7, bTree(4,nil,nil), bTree(9,nil,nil)), bTree(11,nil,nil)), [4,7,9,10,11]).
test(postorder):- postorder(bTree(10, bTree(7, bTree(4,nil,nil), bTree(9,nil,nil)), bTree(11,nil,nil)), [4,9,7,11,10]).
test(preorder):- preorder(bTree(10, bTree(7, bTree(4,nil,nil), bTree(9,nil,nil)), bTree(11,nil,nil)), [10,7,4,9,11]).

:- end_tests(bt).
