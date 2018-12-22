-module(anagram).
-export([all/1]).

all([]) -> [[]];
all(L) ->[
		  [H|T] || H <-L, T <- all(L -- [H])
		 ].

%% all("12") "12"其实就是列表
%% 第一次为12, all("2") -->a([])
