-module(dog).
-export([init/1, bark/1]).

init(Name) ->
	io:format("dog ~p~n", [Name]).

bark(RabbitId) ->
	io:format("rabbit ~p stop\n",RabbitId),
	RabbitId ! {self(), "little rabbit stop there"}.

