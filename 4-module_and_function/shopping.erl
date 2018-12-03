-module(shopping).
-export([buy/1,buy2/1, buy3/1]).
-import(goods,[price/1]).
-import(lists,[map/2]).

buy(L) ->
	lists:sum(map(fun({Name,Num}) -> Num * price(Name) end, L)).

buy2(L) ->
	F = fun({Name,Num}) ->
				Num * price(Name)
		end,
	lists:sum(map(F,L)).

buy3(L) -> 
	F = fun({Name,Num}) ->
				Num * price(Name)
		end,
	lists:sum([F(X) || X <- L]).
