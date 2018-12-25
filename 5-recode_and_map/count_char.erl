-module(count_char).
-export([count_characters/1,print_map/1]).

count_characters([H|T]) ->
	help([H|T],#{H=>0}).		

help([H|T],Map)->
	print_map(Map),
	N = maps:get(H,Map,0) + 1,
	%% Map#{H=>N}) 更新Map中键H 对应的值。然后返回一个新的map
	help(T,Map#{H=>N});
help([],Map) -> Map.

print_map(Map) ->
	maps:fold(
	  fun(K,V,ok) ->
			  io:format("~p: ~p~n",[K,V])
	  end,ok,Map
	 ).

	%% maps:fold(Fun,Init, MapOrIter) -> Acc
%% eg:
%% Fun = fun(K,V,Sum) when is_list(K) -> V + Sum end,
%% Map = #{"k1"=>2,"k2"=>3,"k3"=>4},
%% maps:fold(Fun,0,Map) -> 2+3+4 = 9
