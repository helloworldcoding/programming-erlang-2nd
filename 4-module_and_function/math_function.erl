-module(math_function).
-export([
		 even/1,
		 odd/1,
		 evens/1,
		 odds/1,
		 filter/2,
		 split/1,
		 split2/1
		]).
%% 判断一个数是否为偶素
even(X) ->
	X rem 2 =:= 0.
odd(X) -> 
	X rem 2 =:= 1.

%% 获取所有的偶数
evens(L) ->
	[X || X<-L, even(X)].

%% 获取所有的奇数
odds(L) -> 
	[X || X<-L, odd(X)].

filter(F,L) ->
	[X || X<-L,F(X)].

%% 不使用归集器
split(L)->
	Evens = evens(L),
	Odds = odds(L),
	{Evens,Odds}.

%% 使用归集器
split2(L)->
	split_help(L,[],[]).

split_help([],Odds,Evens) ->
	{Odds,Evens};
split_help([H|T],Odds,Evens) ->
	case even(H) of
		true -> split_help(T,Odds,[H|Evens]);
		false -> split_help(T,[H|Odds],Evens)
	end.
	



