
% median takes in a list and determines whether M is the median.

median(L,M) :-
    member(M,L) , 
    select(M, L, N) ,
    partition(N,M,C,D) , 
    length(C,Y) , length(D,Z), Y =:= Z .


% partition takes args (list, val, listLess, listGreater).
% it determines if dividing a list into things less than the
% given and things greater than the given create 
% the two passed sublists.

partition([], _, [], []).
partition([X|L],V,[X|A],B) :- X =< V, partition(L, V, A, B).
partition([X|L],V,A,[X|B]) :- X >= V, partition(L, V, A, B).


% How partition works, and how it also doesn't work
%
% in the first recursive case, it checks that 
% everything in listLess is less than val
% 
% then, once list A is empty, 
% it recurs through the second case, checking
% everything in listGreater is more than val
%
% this also checks at the same time that everything in the 
% starting list is in either listLess or listGreater
%
%
% Fun fact: partition fails in certain cases.
%
% partition([5, 4, 1, 2], 3, [1, 2], [4, 5])
% partition([4, 5, 1, 2], 3, [1, 2], [5, 4])
% 
% these cases both fail. It's because partition cares about order.
% however, in median, partition is passed variables for A and B.
% this means that the order issue never manifests in median.
%

