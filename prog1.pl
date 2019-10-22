

prereq(introCS,dataStructs).
prereq(dataStructs,progLangs).
prereq(dataStructs,graphics).
prereq(linAlg,graphics).


required(Course,NextCourse) :- prereq(Course,NextCourse).
required(Course,NextCourse) :-
    prereq(Course,SomeOtherCourse),required(SomeOtherCourse,NextCourse).


countTo(1,[1]).
countTo(2,[1,2]).
countTo(3,[1,2,3]).
countTo(4,[1,2,3,4]).



appendTo([],L,L).
appendTo([H | T1],L2,[H | T3]) :- appendTo(T1,L2,T1).

