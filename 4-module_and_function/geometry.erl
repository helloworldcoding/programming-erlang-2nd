-module(geometry).
-export([area/1,area/2,area/3,test/0]).


test() ->
	3.14 = area(1),
	2.0  = area(2,2).

area(R) ->
	R*R*3.14.
area(Base,Heigh) ->
	0.5*Base*Heigh.

%% 海伦公式
area(A,B,C) ->
	S = 0.5*(A+B+C),
	math:sqrt(S*(S-A)*(S-B)*(S-C)).
