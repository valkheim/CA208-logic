/* binary trees tests */
:- begin_tests(bt).

:- include(bt).

test(emptyBT):- emptyBT().
test(emptyBT):- emptyBT(nil).
test(emptyBT):- emptyBT(bTree(nil,nil,nil)).
test(emptyBT):- \+ emptyBT(bTree(bTree(a,nil,nil),nil,nil)).
test(emptyBT):- \+ emptyBT(bTree(nil,bTree(a,nil,nil),nil)).
test(emptyBT):- \+ emptyBT(bTree(nil,nil,bTree(a,nil,nil))).

test(isValidNode):- isValidNode(bTree(2,bTree(1,nil,nil),bTree(3,nil,nil))).
test(isValidNode):- isValidNode(bTree(b,bTree(a,nil,nil),bTree(c,nil,nil))).
test(isValidNode):- isValidNode(bTree(2,bTree(1,nil,nil),bTree(3,nil,nil))).
test(isValidNode):- isValidNode(bTree(2,nil,bTree(3,nil,nil))).
test(isValidNode):- isValidNode(bTree(2,bTree(1,nil,nil),nil)).
test(isValidNode):- \+ isNode(bTree()).
test(isValidNode):- \+ isValidNode(bTree(nil,bTree(1,nil,nil),bTree(3,nil,nil))).

test(isValidNode):- isValidNode(bTree(2,bTree(1,nil,nil),bTree(3,nil,nil))).
test(isValidNode):- isValidNode(bTree(2, bTree(1, nil,nil), bTree(3,bTree(nil, 2, nil),bTree(4,nil,nil)))).
test(isValidNode):- isValidNode(bTree(2, bTree(5, nil,nil), bTree(3,bTree(nil, 2, nil),bTree(4,nil,nil)))).
test(isValidNode):- isValidNode(bTree(b, bTree(a, nil,nil), bTree(c,bTree(nil, b, nil),bTree(d,nil,nil)))).

/*
test(singleNode):- bTree(2,bTree(1,nil,nil),bTree(3,nil,nil)).
test(singleNode):- bTree(2,bTree(2,nil,nil),bTree(3,nil,nil)).
test(singleNode):- bTree(2,bTree(1,nil,nil),bTree(2,nil,nil)).

test(singleNode):- \+ bTree(2,bTree(2,nil,nil),bTree(1,nil,nil)).
test(singleNode):- \+ bTree(2,bTree(3,nil,nil),bTree(3,nil,nil)).
test(singleNode):- bTree(b,bTree(a,nil,nil),bTree(c,nil,nil)).
test(singleNode):- bTree(b,bTree(b,nil,nil),bTree(c,nil,nil)).
test(singleNode):- \+ bTree(b,bTree(b,nil,nil),bTree(b,nil,nil)).
test(singleNode):- \+ bTree(b,bTree(b,nil,nil),bTree(a,nil,nil)).
test(singleNode):- \+ bTree(b,bTree(c,nil,nil),bTree(c,nil,nil)).

test(leftSubTree):- bTree(6, bTree(5,bTree(4,nil,nil),bTree(6,nil,nil)), bTree(7,nil,nil)).
test(leftSubTree):- bTree(6, bTree(5,bTree(16,nil,nil),bTree(6,nil,nil)), bTree(7,nil,nil)).
test(rightSubTree):- \+ bTree(6, bTree(5,nil,nil), bTree(7,bTree(6,nil,nil),bTree(8,nil,nil)).
test(rightSubTree):- \+ bTree(6, bTree(5,nil,nil), bTree(7,bTree(6,nil,nil),bTree(1,nil,nil)).
*/

:- end_tests(bt).
