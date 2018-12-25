
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
		2.catch
