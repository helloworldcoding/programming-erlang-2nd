-module(my_file).

-export([read/1,safe_read/1,log/2]).

read(F) ->
	case file:read_file(F) of
		{ok,Bin} -> Bin;
		{error,Why} -> 
			error(Why)
	end.


safe_read(F) ->
	try read(F) 
	catch
		error:Err -> log(Err,"error")
	end.

log(Log,Type) ->
	Filename = string:concat(Type,".log"),
	{ok,Fh} = file:open(Filename,[append]),
	file:write(Fh,erlang:get_stacktrace()),
	file:write(Fh,term_to_binary(Log)),
	file:close(Fh).


