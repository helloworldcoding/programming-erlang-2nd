
#### let it crash
	任其崩溃: 
		在描述函数的行为时，应该只考虑合法的输入参数，其他所有参数都将导致内部错误并自动被检测到。
		永远不能让函数对非法的参数返回值，而是应该抛出一个异常错误。
		
	exit(Why) 终止当前进程。信号{'EXIT',Pid,Why}广播到当前进程链接的所有程序。
	
	throw(Why) 抛出一个异常

	error(Why) 指示“崩溃性错误”，也就是调用者没有准备好的处理的非常严重的问题。它与系统内部生成的错误差不多。

	捕获异常：
		1.try... catch
			语法：
				try FuncOrExpressionSeq of
					Pattern1 [when Gurad1] -> Expressions1;
					Pattern2 [when Gurad2] -> Expressions2;
					...
				catch
					ExceptionType1:ExPattern1 [when ExGuard1] -> ExExpressions1;
					ExceptionType2:ExPattern2 [when ExGuard2] -> ExExpressions2;
					...
				after
					AfterExpressions
				end
			执行过程：
				1.执行FuncOrExpressionSeq.执行过程没有包抛出异常，分别与Pattern(和关卡)等模式匹配，直到成功,如果没有成功，会抛异常而且不会被这个结构的try--catch捕获。整个try ... catch的值就是模式匹配之后的表达式。
				2.如果执行FuncOrExpressionSeq过程中抛出异常。ExPattern1等捕捉模式就会与它们进行匹配。ExceptionType是一个原子(throw,exit,error其中之一),如果省略ExceptionType,默认就是throw
				3.Erlang运行时系统检测到的内部错误总是带有error标签
				4.after之后的代码，一定会执行，不管是否有错误异常,但它的返回值会被抛弃.
		2.catch
