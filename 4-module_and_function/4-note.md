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
	当单独定义函数子句不方便的时候。
	
	1.case表达式
	case Expression of
		Pattern1 [when Guard1] -> Expr_seq1;
		Pattern2 [when Guard2] -> Expr_seq2;
		...
		PatternN [when GuardN] -> Expr_seqN
		%% 都不匹配，就发生错误异常
	end

	2.if表达式
	if 
		Gurad1 -> Expr_seq1;
		Gurad2 -> Expr_seq2;
		...
		GuradN -> Expr_seqN
		%% 依次执行Guard的值，为true,则执行表达式Expr_seq。
		%% 如果所有的关卡都失败，发生异常
	end

	几个要点：
	1.总是向列表头添加元素
	2.从输入列表的头部提取元素，然后把它们添加都输出列表的头部，形成的结果是与输入列表顺序相反的输出列表
	3.如果顺序很重要，就调用lists:reverse/1这个高度优化过的函数


**归集器**
	accumulator
	举例：只遍历一次，把奇偶参数分别添加到合适的列表里，这些列表被成为归集器。
	
