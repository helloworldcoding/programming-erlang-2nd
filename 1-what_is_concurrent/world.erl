-module(world).
-export([start/0]).

start() ->
	Joe = spawn(person, init, ["Joe"]),
	Tome = spawn(person, init, ["Tome"]),
	Jack = spawn(person, init, ["Jack"]),
	BlackTiger = spawn(dog, init, ["heihu"]),
	Yutu = spawn(rabbit, init, ["yutu"]),
	io:format("there are ~p~p~p~p~p in the world~n",[Joe,Tome,Jack,BlackTiger,Yutu]),
	io:format("there are ~p in the world~n",[[Joe,Tome,Jack,BlackTiger,Yutu]]).
