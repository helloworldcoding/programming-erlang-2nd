-module(rabbit).
-export([init/1, listen/0]).

init(Name) ->
	io:format("rabbit ~p~n", [Name]).

listen() ->
	receive 
		{From, Message} ->
			io:format("~p is coming 大家快跑",[From]),
	end
