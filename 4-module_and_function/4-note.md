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

	List comprehension
	[X || Qualifier1, Qualifier2, ... ]
	X 是任意一条表达式，后面的限定符(Qualifier)可以是生成器、位串生成器、过滤器。
	生成器(generator),写法： Pattern <- ListExper
	位串(bitstring)生成器，写法：BitStringPattern <= BitStringExpr
	过滤器(filter), 可以是判断函数（返回true或false的函数),也可以是布尔表达式
	%% 类别推导里的生成器，部分起着过滤器的功能
	>[X || {a,X} <- [{a,2},{b,1},{c,3},{a,4},hello,"ww"]]
	[2,4]

**内置函数**
	BIF built-in function

**关卡**
	guard 一种结构，可增强模式匹配的威力
	max(X,Y) when X > Y -> X;
	max(X,Y) ->  Y;

	关卡位置：任何支持表达式的地方。
		1.出现在函数定义里的头部，需要用when关键字引入
	关卡的值：
		1.true
		2.false
	
	关卡序列 guard sequence
		1. G1,G2,...,G2  逗号分隔，所有的关卡为true，整体才为true
		2. G1;G2;...;G2 只要有一个为true，整体为true
	
	特性：
		1.不能调用用户定义的函数
		2.原子true
		3.其他常量(各种数据结构和已绑定的变量),它们在关卡表达式里会成功为false
		4.可调用关卡判断函数(is_tuple,...)和一些BIF(abs,element..)
		5.数据结构比较
		6.算术表达式
		7.布尔表达式
		8.短路布尔表达式
		
	if和case语句
