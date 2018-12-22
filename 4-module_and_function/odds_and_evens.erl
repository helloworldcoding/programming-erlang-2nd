-module(odds_and_evens).
-export([odd_and_even/1]).


odd_and_even(L) ->
	help(L,[],[]).

help([],Odds,Evens)->
	{Odds,Evens};
help([H|T],Odds,Evens)->
	case (H rem 2) of
		1 -> help(T,[H|Odds],Evens);
		0 -> help(T,Odds,[H|Evens])
	end.
