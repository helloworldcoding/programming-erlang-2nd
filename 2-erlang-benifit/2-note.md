#####变量和原子
	
	变量：以大写字母开头.
	原子(符号常量): 以小写字母开头

##### 编译
	1.erlang shell内部编译
		c(ModeName)
	2.erlang shell 外部编译
		erlc FileName 编译
		erl -noshell -s hello start -s init stop 加载hello模块并执行hello:start() 函数，随后，它执行了init:stop(),结束了erlang会话
		
