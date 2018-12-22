-module(gougu).

-export([gougu_num/1]).

%% A =< B < C < A+B
gougu_num(N)->
	[{A,B,C} ||
		A <- lists:seq(1,N),
		B <- lists:seq(A,N),
		C <- lists:seq(B,N),
		A*A + B*B =:= C*C
	].
