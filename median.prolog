


median(L,M) :- write('help'),
    member(M,L) , 
    write(M),
    select(M, L, N) ,
    write(N), 
    partition(N,M,C,D) , 
    write(C), write(D),
    length(C,Y) , length(D,Z), Y =:= Z .

partition(L,V,A,B) :-  listSubset(A,L),
    listSubset(B,L) ,
    upperBound(A,V) , lowerBound(B,V).

lowerBound([],_).
lowerBound([A | T], M) :- M =< A , lowerBound(T,M).

upperBound([],_).
upperBound([A | T], M) :- M >= A , upperBound(T,M).

min(L,M) :- member(M,L), lowerBound(L,M).
max(L,M) :- upperBound(L,M) , member(M,L).

listSubset([],_).
listSubset([A | X], Y) :- member(A, Y) , 
    listSubset(X,Y).


