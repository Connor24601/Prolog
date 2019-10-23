/**/

% To run, 
% solve(X), show(X).


% input puzzle
% Puzzle 1
%
%init(2,3,46).
%init(2,4,45).
%init(2,6,55).
%init(2,7,74).
%init(3,2,38).
%init(3,5,43).
%init(3,8,78).
%init(4,2,35).
%init(4,8,71).
%init(5,3,33).
%init(5,7,59).
%init(6,2,17).
%init(6,8,67).
%init(7,2,18).
%init(7,8,64).
%init(8,3,24).
%init(8,4,21).
%init(8,6,1).
%init(8,7,2).
%
% Puzzle 2

init(1,1,13).
init(1,5,27).
init(1,9,39).

init(2,2,11).
init(2,5,24).
init(2,8,37).

init(5,1,71).
init(5,2,70).
init(5,8,34).
init(5,9,43).

init(8,2,81).
init(8,5,62).
init(8,8,53).

init(9,1,79).
init(9,5,63).
init(9,9,51).


% Dave's code

show(Soln) :- reverse(Soln,Forwards), write('\n'),
              member(Row,[1,2,3,4,5,6,7,8,9]),
              write('\n'),
              member(Col,[1,2,3,4,5,6,7,8,9]),
              nth1(Value,Forwards,[Row,Col]),
              write(Value),write('\t'),
              fail.

% our code

adjacent(I,J,X,Y) :- X is I + 1 , Y is J , X =< 9.
adjacent(I,J,X,Y) :- X is I - 1 , Y is J , X > 0.
adjacent(I,J,X,Y) :- X is I , Y is J + 1 , Y =< 9.
adjacent(I,J,X,Y) :- X is I , Y is J - 1 , Y > 0.

% the next square was given
validSpace(Partial,I,J,X,Y) :- adjacent(I,J,X,Y) , 
    init(X,Y,Val) ,
    Newval is Val - 1 ,
    length(Partial, Newval).

% the next square was not given
validSpace(Partial,I,J,X,Y) :- adjacent(I,J,X,Y) ,
    \+ init(X,Y,_) ,
    length(Partial, Val) ,
    Newval is Val + 1 ,
    \+ init(_,_,Newval) ,
    \+ member([X,Y],Partial).

completed(Finished, Finished) :- length(Finished,81).
completed([[I,J] | Rest] , Finished) :- 
    validSpace([[I,J] | Rest], I, J, X, Y) ,
    completed([[X,Y],[I,J] | Rest], Finished).

% the starting square was given
solve(Finished) :-
    member(X,[1,2,3,4,5,6,7,8,9]) ,
    member(Y,[1,2,3,4,5,6,7,8,9]) ,
    init(X,Y,1) ,
    completed([[X,Y]], Finished).

% the starting square was not given
solve(Finished) :- 
    member(X,[1,2,3,4,5,6,7,8,9]) ,
    member(Y,[1,2,3,4,5,6,7,8,9]) ,
    \+ init(_,_,1) ,
    \+ init(X, Y, _) ,
    completed([[X,Y]],Finished).

   
