/*********************/
/* Charles PAULET    */
/* 18103197          */
/* bt.plt            */
/* Binary tree tests */
/*********************/
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

test(search):- search(bTree(b,nil,nil), b).
test(search):- \+ search(bTree(a,nil,nil), b).
test(search):- search(bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)), 4).
test(search):- search(bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)), 8).
test(search):- search(bTree(5,bTree(4,nil,bTree(5,nil,nil)),bTree(8,nil,nil)), 5).
test(search):- search(bTree(5,bTree(4,nil,nil),bTree(8,bTree(7,nil,nil),nil)), 7).
test(search):- search(bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))), 9).
test(search):- \+ search(bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))), 42).

test(max):- max(1,2,2).
test(max):- max(2,1,2).
test(max):- max(2,2,2).
test(max):- max(a,b,b).
test(max):- max(b,a,b).
test(max):- max(b,b,b).

test(height):- height(nil,0).
test(height):- height(bTree(nil,nil,nil),0).
test(height):- height(bTree(4,nil,nil),1).
test(height):- height(bTree(4,nil,bTree(6,nil,nil)),2).
test(height):- height(bTree(4,bTree(1,nil,nil),nil),2).

test(insert):- insert(2, bTree(5,nil,nil), bTree(5, bTree(2, nil, nil), nil)).
test(insert):- insert(6, bTree(5,nil,nil), bTree(5, nil, bTree(6, nil, nil))).
:- end_tests(bt).
