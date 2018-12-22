-module(quick_sort).

-export([sort/1]).

sort([]) -> [];
sort([Piovt|T])->
	[X || X <- T, X < Piovt]
	++[Piovt]++
	[X || X <- T, X >= Piovt].
