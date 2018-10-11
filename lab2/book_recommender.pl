/* book(title, author, genre, number_of_pages). */
/*
book("Don Quixote", "Miguel de Cervantes", "Chivalric romance", 992).
book("The Stranger", "Albert Camus", "drama", 159).
book("Hacking, the art of exploitation", "Jon Erickson", "reference", 488).
book("Harry Potter and the Philosophers Stone", "J K Rowling", "fiction", 306).
*/

book(illiad, homer, study, 500).
book(c, richie, study, 150).
book(nt_bible, sams, reference, 480).
book(monty_python, cleese, comedy, 300).
book(the_stranger, camus, drama, 159).
book(harry_potter, jkr, fiction, 306).

library(X):- findall(book(A,B,C,D), book(A,B,C,D), X).

literary(L):- findall(book(A,B,_,D), book(A,B,drama,D), L).

isHoliday(book(_,_,Genre,Pages)):-
  Pages < 400,
  Genre \= drama,
  Genre \= reference.
holiday(_,[]).
holiday(B,[B|L]):-
  isHoliday(B),
  holiday(B,L).
holiday(B,[_|T]):-
  holiday(B,T).

isRevision(book(_,_,Genre,Pages)):-
  Pages > 300,
  Genre = study | Genre = reference.
revision(_,[]).
revision(B,[B|T]):-
  isRevision(B),
  revision(B,T).
revision(B,[_|T]):-
  revision(B,T).

isLiterary(book(_,_,Genre,_)):-
  Genre = drama.
literary(_,[]).
literary(B,[B|T]):-
  isLiterary(B),
  literary(B,T).
literary(B,[_|T]):-
  literary(B,T).

isLeisure(book(_,_,Genre,_)):-
  Genre = comedy | Genre = fiction.
leisure(_,[]).
leisure(B,[B|T]):-
  isLeisure(B),
  leisure(B,T).
leisure(B,[_|T]):-
  leisure(B,T).
