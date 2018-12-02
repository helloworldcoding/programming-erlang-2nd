
#### 变量和原子
	
	变量：以大写字母开头.
	原子(符号常量): 以小写字母开头

#### 编译
	1.erlang shell内部编译
		c(ModeName)
	2.erlang shell 外部编译
		erlc FileName 编译
		erl -noshell -s hello start -s init stop 加载hello模块并执行hello:start() 函数，随后，它执行了init:stop(),结束了erlang会话
		
#### 接收消息
	loop(Dir) ->
		receive
			Command1 -> 
				.... ,
				... ; %% 这个分号不能缺少
			Command2 ->
				... ,
				...   %% 最后一个不用写分号
		end,
		loop(Dir). %% 循环掉调用, Erlang会”尾部调用“

#### 模式匹配用于选择消息
	receive
		Pattern1 ->
			Actions1,
			Actions2;
		Pattern2 ->
			Actions3,
			Actions4;
		...
		
		PatternN ->
			ActionsN,
			ActionsN2
	end

#### self()
	1.获取进程标识符

#### file:script(Filename) 
	执行文件中的命令	
	文件内容： io:format(os:cmd(clear)).
	file:script(Filename). 就可以清屏了

