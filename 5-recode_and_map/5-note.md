
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
	
	map
		1.语法：
			#{Key1 Op Val1, Key2 Op Val2,...,KeyN Op ValN}
			Op => 或 :=
			例如： Map1 = #{a=>1,name=>"zhangsan"}.
			Map2 = Map1#{}.
			Map3 = Map1#{a=>2}.

			Key => Val 总会成功 
			Key := Val Key不存在，就会报错
			一般情况下 创建map，用=>,更新map用:=


