-module(my_tuple_to_list).
-export([tuple2list/1,t2l/1]).


%% 相对简单的方法
tuple2list(Tuple) ->
	[element(Index,Tuple) || Index <- lists:seq(1,tuple_size(Tuple))].

%% 罗嗦一些
t2l({})->[];
t2l(Tuple)->t2l_help(Tuple,1,tuple_size(Tuple)).

t2l_help(Tuple,Size,Size)->[element(Size,Tuple)];
t2l_help(Tuple,Pos,Size)->[element(Pos,Tuple)|t2l_help(Tuple,Pos+1,Size)].
