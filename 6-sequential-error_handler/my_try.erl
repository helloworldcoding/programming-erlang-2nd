-module(my_try).

-export([generate_exception/1,demo/0,demo2/0]).
%%-compile(export_all).

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'Exit',a};
generate_exception(5) -> error(a).

demo() ->
	[cather(I) || I <- [1,2,3,4,5]].

demo2() ->
	[cather2(I) || I <- lists:seq(1,5)].
cather2(I) ->
	catch generate_exception(I).

cather(N) ->
	try generate_exception(N) of
		%%a -> {N,noraml,a}
		Val -> {N,noraml,Val}
	catch
		throw:X -> 
			io:format("throw\n"),
			{N,X,thrown,erlang:get_stacktrace()};
		exit:X -> 
			io:format("exit\n"),
			{N,exited,X};
		error:X -> 
			io:format("error\n"),
			{N,error,X}
	after
		L = [1+2],
		io:format("~p\n",L)
	end.




