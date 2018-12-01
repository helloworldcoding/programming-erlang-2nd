###第一章  什么是并发

	并发(concurrent) 计算机在不同的任务之间分享时间，使人产生这些任务是并行运行的错觉
	同时(simultaneous)
	并行(parallel) 多个cpu或者多核才能并行

##### 基本

	一个文件一个module
	-module(文件名不要.erl).
	导出函数列表,供其他模块使用
	-export([Fun1/N1, Fun2/N2,....]).
	
	spawn(ModName, FuncName, [Arg1,Arg2, ..., ArgN])
	spawn返回一个进程标识符如：<0.153.0>

	发送消息
	Pid ! Msg  发送消息Msg到进程Pid

	接收消息
	receive
		{From, Message} ->
			...
	end

	
