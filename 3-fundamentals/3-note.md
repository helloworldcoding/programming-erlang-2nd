#### 3 fundamentals 基本概念
	
**erlang shell**
	erl 打开erlang shell
	q(). 正常退出. 是init:stop()的别名
	Ctrl+C 然后再 a 可能会导致数据损坏

	Erlang模块里的语法形式不是表达式，不能被Erlang shell理解.
	如 -module -export

#### 整数运算
	
	整数是精确存储，而且支持任意位的计算，不会溢出
	> 2 + 3*4  
	14

	>16#cafe * 32#sugar  %%十六进制和三十二进制
	
	>8#123.  %% 八进制
	84

#### 所有的变量名都必须以大写字母开头
	singel-assignment variable(一次性赋值变量)
	
	**作用域**
	变量的作用域是它定义时所处的词汇单元。
	如果X被用在一条单独的字句之内，它的指不会”逃出“这个字句。
	同一函数的子句，不存在共享私有或全局变量的说法。
	出现在不同函数里的X，它们都是不相干的。

#### 浮点数
	在Erlang内部 使用64位的IEEE 754-1985浮点数
	>5/3
	1.6666666666667
	/会自动转换为浮点数
	>4/2
	2.0

	整除div  取余rem, 这两个操作符， 只能用整数
	>5 div 3.
	1
	>14 rem 3.
	2
	>3.2 div 1. %% error

#### 原子
	
	原子被用来表示常量值
	是全局的，不需要宏定义或者包含文件就能实现
	
	**表示方法**
	以小写字母开头，后接字母、数字、下划线、@
	放在单引号内，'Monday','an atom with sapces',在单引号内第一个字符可以是大写字母，也可以包含字母数字之外的字符

	一个原子的值，就是它本身

	双引号作用：给字符串字面量（string literal)定界

	erlang 是一种函数式编程语言，每个表达式都必须有一个值。这包括整数和原子。只不过他们是非常简单的表达式

#### 元组(tuple)
	把一些数量固定的项目归成单一的实体。
	用大括号把想要表达的值括起来，并用逗号分隔它们。

	编程风格：元组的第一个元素是原子，并用它来表示元组是什么。
	>P = {person,{name, joe},{height,1.82}}.
	
	**模式匹配**
	erlang的根基。从数据结构中提取值，控制函数内部流程，在并行程序里给进程发消息，都用到了摸索匹配。

	提取元组中的元素
	>{person,{name,Name},_} = P
	_ 匿名变量。用于表示不感兴趣的那些变量，同一模式里的多个_不必绑定相同的值。


#### 列表(list)

	存放任意数量的事物。
	用中括号把列表元素括起来，并用逗号分隔开.
	>Geo = [{square,{10,10},10},{triangle,{1,2},{3,4},{6,8}}].

	**专业术语**
	列表第一个元素是列表头(head)，除了列表头，剩下的就是列表尾(tail).
	如果T是列表，那么[H|T]也是列表，他的头是H，尾是T 
	只要用[...|T]的语法构建一个列表，应该确保T也是列表。(编程习惯）
	给T的开头添加元素，[E1,E2,...,En|T]

	**提取元素**
	[X|Y] = L

	**打印列表**
	如果列表里的元素都是整数，且整数都代表可打印字符，它就会将其打印成字符串字面量，否则打印成列表记法。

	>$a %% 美元符号语法，获取字符的ansic
	97

#### 字符串（其实erlang没有字符串）
	
	可以用一个整数组成的列表来表示字符串。(列表中的每一个元素都代表了一个Unicode代码点(codepoint).  可以用字符串字面量来创建这样的列表,Name="hello","hello"其实就是一个列表的简写。
	
	二进制型来表示字符串.

	>X = "abc\x{221e}bb". %% \x{221e} Unicode 无穷大的16进制的值
	[97,98,99,8734,98,98]


#### help().
	b() 输出绑定的变量列表
	regs() information about registered processes
	l(Module) load or reload module
	lm() load all modified modules




	
