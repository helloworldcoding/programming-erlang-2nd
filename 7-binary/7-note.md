
#### 二进制binary

	1.保存大量无结构的数据内容，如大型字符串或文件内容
	2.二进制型的位数
		是8的整数倍   --> 对应一个字符串
		不是8的整数倍 --> 位串(bitstring)
				
	3.二进制的形式
		编写和打印形式，双小于号于双大于号之间，一列整数或字符串
		1><<5,10,30>>.
		<<5,10,30>>
		2.<<"hello">>
		<<"hello">>
		3.<<65,66,67>> %% 如果数字全部是可打印的编码，则会打印对应的字符,和打印字符串一样
		<<"ABC">>
	4.一些函数
		list_to_binary(L) -> B	
		binary:list_to_bin(L) -> B	
		%% 返回一个二进制，一个去掉了所有括号的iolist。iolist定义:一个列表包含的元素是0..255的整数、二进制或者其他iolist

		split_binary(B,Pos) -> {B1,B2}
		%% 0 <= Pos <= B的长度 split_binary(B,0) -> {<<>>,B}

		term_to_binary(Term) -> Bin %% erlang的所有数据类型转换为二进制,使用了外部数据格式(external term format)
		
		binary_to_term(Bin) -> Term %% 二进制还原为原始erlang数据
		1>L = [1,2,3,4,65,98].
		2>B = list_to_binary(L).
		<<1,2,3,4,65,98>>	
		3>Term = term_to_binary(L).
		<<131,107,0,6,1,2,3,4,65,98>>
		4>byte_size(B)
		6
		5>byte_size(Term)
		10

	位语法
		从二进制数据里提取或加入单独的位或者位串。
		M = <<X:3,Y:7,Z:6>> %% 把三个变量X,Y,Z打包进一个16位的内存区域
		<<X1:3,Y1:7,Z1:6>> = M %% 提取变量
		
		位语法表达式
		<<>>
		<<E1,E2,...,En>>
		Ei标识出二进制型或者位串里的一个片段。
			Ei = Value |  %% 数字
				 Value:Size | %%  12:3
				 Value/TypeSpeifierList |
				 Value:Size/TypeSpecifierList
			Value是变量，字符串，或是能得出整数、浮点数、二进制的表达式
			Size是得出整数的表达式
			<<Size:4,Data:Size/binary>> %% 合法的摸索，因为Size的值，已经由二进制的前4位解包获得
			Size的值指明了片段的大小。它的默认值取决于不同的数据类型，对整数来说是8,浮点数是64,二进制就是该二进制的大小。
			在模式匹配里，默认值只对最后那个元素有效，如果未指定片段大小，就会采用默认值。

			TypeSpecifierList(类型指定列表)是用连字符分隔的列表，形式为：End-Sign-Type-Unit。这些项任何一个可以被省略(系统会用默认值)，各项也可以任意排序。
			1.End可以是 big|little|native
				网路字节序(network byte order)
			2.Sign可以是signed|unsigned  默认值是unsigned
			3.Type可以是integer|float|binary|bytes|bitstring|bits|utf8|utf16|utf32  默认是integer
			4.Unit的写法是unit:1|2|...256
				integer,float和bitsting的Unit默认值是1,
				binary 是8,
				utf16,utf32 无需提供该值
			
		一个片段的总长度是Size × Unit字节。binary类型的片段长度必需是8的整数倍			

		1><<16#12345678:32/big-signed>>.
		<<18,52,86,120>>
		2><<16#12345678:32/little-signed>>.
		<<120,86,52,18>>
		3><<12345678:32/little-signed>>. %% 地位先发送
		<<78,97,188,0>>
		4><<12345678:32/big>>.
		<<0,188,97,78>> %% 高位的数据先发送
		5>integer_to_list(12345678,2).
		"101111000110000101001110"
		"10111100 01100001 01001110"
		188		   97		78

		进制转换
		10 -> 2 integer_to_list(12,2)
	    2 -> 10 list_to_integer("111100",10).
		

		
