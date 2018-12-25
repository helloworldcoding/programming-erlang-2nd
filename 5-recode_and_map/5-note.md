
### record 记录
	
	record使用场景
	1.可以用一些预先确定且数量固定的原子来表示数据时。
	2.当记录里的元素数量和元素名称不会随时间而变化时。
	3.当存储空间是个问题，比如：一大堆元组，而且每个元组结构相同

	map使用场景
	1.键不能预先知道，可以用map来表示键-值数据结构
	2.当存在大量不同的键时用来表示数据
	3.当方便使用很重要而效率无关紧要时，作为万能的数据结构使用
	4.用作“自解释”的数据结构，即容易从键名猜出值的含义
	5.用来表示键-值解析树，如xml或配文件
	6.用json来和其他编程语言通信


	记录语法：
	-record(Name，{
				key1 = Vaule1,
				key2 = Value2,
				...
				key3, %% 相当于key3 = undefined
				...

			}).
	Name是记录名，比如todo，记录的各个字段的名称key1..keyN必须是原子，
	一般把记录的定义保存在.hrl文件里

	例子：
		1.定义一个记录
		-recode(todo,{status=unstart,who=lin,text}).
		2.创建一个记录
		X = #todo{}.
		X1 = #todo{status=start,text="fix bug"}.
		3.提取记录字段
			a)模式匹配 #todo{who=W,text=Txt} = X1.
			b)点语法 X1#todo.text.
		4.记录就是元组的另一种形式
	
	map语法：
		1.定义创建一个map
		#{Key1 Op Val1, Key2 Op Val2,...,KeyN Op ValN}
		Op => 或 :=
		例如： Map1 = #{a=>1,name=>"zhangsan"}.
		Map2 = Map1#{}.
		Map3 = Map1#{a=>2}. %%添加一个字段
		Map4 = Map1#{a:=3}. %%更新一个字段

		Key => Val 总会成功 
		Key := Val Key不存在，就会报错
		一般情况下 创建map，用=>,更新map用:=

	maps模块：
		maps:new() -> #{}

		is_map(M) -> bool()
		to_list(M) <--互逆--> from_list(L)
		to_list：把Key和Val转换为键值列表，严格升序
		from_list: 如果列表里同样的key有多个，会使key最后对应的值，之前的value都会被忽略
		size(M) map中的条目数量
		is_key(Key,Map) -> bool()
		get(Key,Map) ->Val. 返回key关联的val，否则抛出异常
		get(Key,Map,Default) 返回Key关联的Val，否则返回Default值
		find(Key,Map) -> {ok,Val} | error
		maps:remove(Key,M) -> M1
		keys(Map) -> [Key1,Key2,...,KeyN] %% 升序
		without([Key1,Key2,..,KeyN],M) -> M1
		

		map排序
		1.maps:size(A) < maps:size(B) 则 A < B
		2.size相同时,maps:to_list(A) < maps:to_list(B) 则 A < B
			A = #{age=>23,name=>"er"}
			B = #{email=>"test@12.com",name=>"er1"}
			C = #{age=>24,name=>"er"}

		3.Map > List|Tuple


