/******************************************************************************/
/*                                                                            */
/*                            Binary tree tests                               */
/*                       Charles PAULET  (ECSAO 18103197)                     */
/*                                                                            */
/******************************************************************************/
:- begin_tests(bt).

:- include(bt).

/******************************************************************************/
/**********                         emptyBT                          **********/
/******************************************************************************/
test(emptyBT):- emptyBT().
test(emptyBT):- emptyBT(nil).
test(emptyBT):- emptyBT(bTree(nil,nil,nil)).

/******************************************************************************/
/**********                       single node                        **********/
/******************************************************************************/
/*************/
/*     2     */
/*    / \    */
/*   1   3   */
test(singleNode):- bTree(2,bTree(1,nil,nil),bTree(3,nil,nil)).
/*************/
/*     b     */
/*    / \    */
/*   a   c   */
test(singleNode):- bTree(b,bTree(a,nil,nil),bTree(c,nil,nil)).
/*************/
/*     2     */
/*    / \    */
/*   2   3   */
test(singleNode):- bTree(2,bTree(2,nil,nil),bTree(3,nil,nil)).
/*************/
/*     2     */
/*    / \    */
/*   1   3   */
test(singleNode):- \+ bTree(2,bTree(1,nil,nil),bTree(2,nil,nil)).
/*************/
/*    nil    */
/*   /   \   */
/*  a     b  */
test(singleNode):- \+ bTree(nil,a,b).

/******************************************************************************/
/**********                         sub trees                        **********/
/******************************************************************************/
/*************/
/*     5     */
/*    / \    */
/*   4   8   */
/*  /        */
/* 4         */
test(leftSubLeftTree):- bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)).
/*************/
/*     5     */
/*    / \    */
/*   4   8   */
/*    \      */
/*     5     */
test(leftSubRightTree):- bTree(5,bTree(4,nil,bTree(5,nil,nil)),bTree(8,nil,nil)).
/*************/
/*     5     */
/*    / \    */
/*   4   8   */
/*      /    */
/*     7     */
test(rightSubLeftTree):- bTree(5,bTree(4,nil,nil),bTree(8,bTree(7,nil,nil),nil)).
/*************/
/*     5     */
/*    / \    */
/*   4   8   */
/*        \  */
/*         9 */
test(rightSubRightTree):- bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))).
/*************/
/*     5     */
/*    / \    */
/*  nil  8   */
/*  / \      */
/*           */
test(nilSubTreeRoot):- \+ bTree(5,bTree(nil,nil,nil),bTree(8,nil,nil)).
/*************/
/*     5     */
/*    / \    */
/*  nil  8   */
/*  /        */
/* 5         */
test(nilSubTreeRoot):- \+ bTree(5,bTree(nil,5,nil),bTree(8,nil,nil)).

/******************************************************************************/
/**********                       merge lists                        **********/
/******************************************************************************/
test(merge_list):- merge_list([],[],[]).
test(merge_list):- merge_list([1],[],[1]).
test(merge_list):- merge_list([],[1],[1]).
test(merge_list):- merge_list([a],[1],[a,1]).
test(merge_list):- merge_list([a,b,c],[1,2,3],[a,b,c,1,2,3]).

/******************************************************************************/
/**********                      tree traversal                      **********/
/******************************************************************************/

/*                 A                                                          */
/*                / \         inorder   : D-B-E-A-C                           */
/*               B   C        postorder : D-E-B-C-A                           */
/*              / \           preorder  : A-B-D-E-C                           */
/*             D   E                                                          */

/*************/
/*     2     */
/*    / \    */
/*   1   3   */
test(inorder):- inorder(bTree(2,bTree(1,nil,nil),bTree(3,nil,nil)), [1,2,3]).
/*************/
/*     2     */
/*    / \    */
/*   2   3   */
test(inorder):- inorder(bTree(2,bTree(2,nil,nil),bTree(3,nil,nil)), [2,2,3]).
/*************/
/*     5     */
/*    / \    */
/*   4   8   */
/*  /        */
/* 4         */
test(inorder):- inorder(bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)), [4,4,5,8]).
/*************/
/*     5     */
/*    / \    */
/*   4   8   */
/*  /        */
/* 5         */
test(inorder):- inorder(bTree(5,bTree(4,nil,bTree(5,nil,nil)),bTree(8,nil,nil)), [4,5,5,8]).
/*************/
/*     5     */
/*    / \    */
/*   4   8   */
/*      /    */
/*     7     */
test(inorder):- inorder(bTree(5,bTree(4,nil,nil),bTree(8,bTree(7,nil,nil),nil)), [4,5,7,8]).
/*************/
/*     5     */
/*    / \    */
/*   4   8   */
/*        \  */
/*         9 */
test(inorder):- inorder(bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))), [4,5,8,9]).
/*************/
/*     10    */
/*    /  \   */
/*   7    11 */
/*  / \      */
/* 4   9     */
test(inorder):- inorder(bTree(10, bTree(7, bTree(4,nil,nil), bTree(9,nil,nil)), bTree(11,nil,nil)), [4,7,9,10,11]).

/*************/
/*     10    */
/*    /  \   */
/*   7    11 */
/*  / \      */
/* 4   9     */
test(postorder):- postorder(bTree(10, bTree(7, bTree(4,nil,nil), bTree(9,nil,nil)), bTree(11,nil,nil)), [4,9,7,11,10]).

/*************/
/*     10    */
/*    /  \   */
/*   7    11 */
/*  / \      */
/* 4   9     */
test(preorder):- preorder(bTree(10, bTree(7, bTree(4,nil,nil), bTree(9,nil,nil)), bTree(11,nil,nil)), [10,7,4,9,11]).

/******************************************************************************/
/**********                       tree search                        **********/
/******************************************************************************/

/*************/
/*b    b     */
test(search):- search(bTree(b,nil,nil), b).
/*************/
/*b    a     */
test(search):- \+ search(bTree(a,nil,nil), b).
/*************/
/*4    5     */
/*    / \    */
/*   4   8   */
/*  /        */
/* 4         */
test(search):- search(bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)), 4).
/*************/
/*8    5     */
/*    / \    */
/*   4   8   */
/*  /        */
/* 4         */
test(search):- search(bTree(5,bTree(4,bTree(4,nil,nil),nil),bTree(8,nil,nil)), 8).
/*************/
/*5    5     */
/*    / \    */
/*   4   8   */
/*    \      */
/*     5     */
test(search):- search(bTree(5,bTree(4,nil,bTree(5,nil,nil)),bTree(8,nil,nil)), 5).
/*************/
/*7    5     */
/*    / \    */
/*   4   8   */
/*      /    */
/*     7     */
test(search):- search(bTree(5,bTree(4,nil,nil),bTree(8,bTree(7,nil,nil),nil)), 7).
/*************/
/*9    5     */
/*    / \    */
/*   4   8   */
/*        \  */
/*         9 */
test(search):- search(bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))), 9).
/*************/
/*42   5     */
/*    / \    */
/*   4   8   */
/*        \  */
/*         9 */
test(search):- \+ search(bTree(5,bTree(4,nil,nil),bTree(8,nil,bTree(9,nil,nil))), 42).

/******************************************************************************/
/**********                            max                           **********/
/******************************************************************************/

test(max):- max(1,2,2).
test(max):- max(2,1,2).
test(max):- max(2,2,2).
test(max):- max(a,b,b).
test(max):- max(b,a,b).
test(max):- max(b,b,b).

/******************************************************************************/
/**********                           height                         **********/
/******************************************************************************/

test(height):- height(nil,0).
test(height):- height(bTree(nil,nil,nil),0).
/*************/
/*1    4     */
test(height):- height(bTree(4,nil,nil),1).
/*************/
/*2    4     */
/*      \    */
/*       6   */
test(height):- height(bTree(4,nil,bTree(6,nil,nil)),2).
/*************/
/*2    4     */
/*    /      */
/*   1       */
test(height):- height(bTree(4,bTree(1,nil,nil),nil),2).

/******************************************************************************/
/**********                           insert                         **********/
/******************************************************************************/

/*                5                                         5                 */
/*               / \                  ---\                 / \                */
/*             nil nil                ---/                2  nil              */
/*                                                       / \                  */
/*                                                     nil nil                */
test(insert):- insert(2, bTree(5,nil,nil), bTree(5, bTree(2, nil, nil), nil)).

/*                5                                         5                 */
/*               / \                  ---\                 / \                */
/*             nil nil                ---/               nil  6               */
/*                                                           / \              */
/*                                                         nil nil            */
test(insert):- insert(6, bTree(5,nil,nil), bTree(5, nil, bTree(6, nil, nil))).

:- end_tests(bt).
