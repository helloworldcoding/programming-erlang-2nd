-module(person).
-export([init/1]).


init(Name) ->
	io:format("I'm ~p~n",[Name]).
