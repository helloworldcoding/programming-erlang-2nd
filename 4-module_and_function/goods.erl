-module(goods).
-export([price/1]).

price(Goods) ->
	case Goods of
		apple -> 4.5;
		orange -> 5;
		book -> 10;
		_ -> 0
	end.
