#### Module & function

	**标点符号**
	逗号(,) 分隔函数调用，数据构造和模式中的参数。
	分号(;) 分隔子句。如函数的定义，case、if、try...catch和receive

	**函数使用方式**
	1.对列表里的每一个元素执行相同的操作.
	2.创建自己的控制抽象
	3.实现可重入解析代码(reentrant parsing code),解析组合器(parser combinator),惰性求值(lazy evaluator)等


	case Expression of
		Pattern1 ->
			Expressions1;
		Pattern2 ->
			Expressions2;
		...
		PatternN ->
			LastExpression
	end

	lists:map(Func(Item), List).
	lists:filter(Func(Item), List).
	[ F(Item) || Item <- List] %% 列表推导 等同于 lists:map(Function(Item),List)

**列表推导**
	[X || Qualifier1, Qualifier2, ... ]
	X 是任意一条表达式，后面的限定符(Qualifier)可以是生成器、位串生成器、过滤器。
	生成器(generator),写法： Pattern <- ListExper
	位串(bitstring)生成器，写法：BitStringPattern <= BitStringExpr
	过滤器(filter), 可以是判断函数（返回true或false的函数),也可以是布尔表达式
	%% 类别推导里的生成器，部分起着过滤器的功能
	>[X || {a,X} <- [{a,2},{b,1},{c,3},{a,4},hello,"ww"]]
	[2,4]
