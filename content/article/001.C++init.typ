#import "/typ/templates/blog.typ": *
#let blog-tags = (
  cpp: "C++",
  programming: "Programming",

)
#show: main.with(
  title: "001.C++ for beginner",
  desc: [C++学习笔记],
  date: "2025-09-05",
  tags: (
    blog-tags.cpp,
    blog-tags.programming,
  ),
)
= Perface
`C++`作为目前工业界的主流，其涉及底层的东西较多，和硬件挂钩，除此以外作为一门低级编程语言，其运算速度相对较快。本人本科曾学习过少量的`C++`,本篇笔记将记录学习过程，重新捡起这个工具（主要是接到项目了）。
= 1.`C++`基础
依然使用`Visual Studio`作为`IDE`,其对新手友好，无需配置冗杂环境。涉及另一个进阶工具`Cmake`会在后续笔记中涉及。
== 1.1.`C++`基础语法
  ```cpp
  #include <iostream>

  int main()
  {
      std::cout << "Hello World!" << std::endl;
      return 0;
  }
  ```
  - `#include <iostream>`: 引入`C++`标准库`iostream`，用于输入输出。
  - `std::cout`: 标准输出流，用于输出数据。
  - `std::endl`: 换行符，用于输出数据并换行。
  - `return 0;`: 返回值，表示程序正常结束。
  - `int main()`: 主函数，程序入口。有且只有一个。
  - `{}`: 代码块，用于包含程序代码。
  其实这段程序也可以将`std::cout << "Hello World!" << std::endl;`简化为`cout << "Hello World!" << endl;`,但要确保`using namespace std;`已包含在代码中。如下：
  ```cpp
  #include <iostream>
  using namespace std;

  int main()
  {
      cout << "Hello World!" << endl;
      return 0;
  }
  ```
运行这段程序，将输出"Hello World!"。这段程序是以后每个程序都要用的。
== 1.2.变量，常数
  ```cpp
  #include <iostream>
  using namespace std;
  //1.单行注释
  /*2.多行注释*/
  //3.变量命名规则：数字不能在第一，变量名不能和保留字一样，只能有字母数字下划线，对大小写敏感
  #define day 7//day值被锁，不能在后面更改
  /*4.sizeof用法：sizeof(数据类型/变量)*/
  int main()//main有且只有一个
  {
    const int month = 12; //锁定month的值为12，后面再赋值会报错，和#define差不多

    int num_1 = 10;int num_2 = 15;string c = "hello world";int sum_1_2 = num_1 + num_2;
    short a = 1;long b = 2;long long d = 3;
    //short，long，long long也是整形，不过占内存不一样

    cout << c << endl;cout << num_1 + num_2 << endl;
    cout << "10+15=" << sum_1_2 << endl;

    cout << "一周有" << day << "天，" << "一年有" << month << "月" << endl;
    cout << "int类型占的内存空间：" << sizeof(int) << endl;//sizeof(a)也可以

    system("pause");
    
    return 0;
  }
  ```
  运行结果：
  ```bash
  hello world
  25
  10+15=25
  一周有7天，一年有12月
  int类型占的内存空间：4
  ```
  - `#define` 定义宏常量，格式为`#define 常量名 常量值`，常量名一般用大写字母。
  - `system("pause")` 暂停程序，等待用户键入。
  - `const` 定义常量，格式为`const 数据类型 变量名 = 变量值`，常量名一般用大写字母。
  - `using namespace std;` 引入标准库。
  - `std::cout` 输出流，格式为`std::cout << "输出内容" << std::endl;`。引入标准库后，可以直接使用`cout`和`endl`。类似`python`中 的`print()`。
  + `C++`作为一个强类型语言，每个变量都有自己的数据类型，不能随便赋值。例如：
    ```cpp
    int a = 10;
    a = "hello world";//错误
    ```
    会报错，提示`不能将“const char [12]”类型的表达式赋值给“int”类型的实体`。
    这是和`python`等动态类型语言不同的地方。
  + `C++`的变量类型和大小如下：
    - `int` 4字节
    - `short` 2字节
    - `long` 4字节
    - `long long` 8字节
    - `float` 4字节
    - `double` 8字节
    - `char` 1字节
    - `bool` 1字节
    - `string` 不定字节
  + `C++`的变量名命名规则：
    - 数字不能在第一
    - 变量名不能和保留字一样
    - 只能有字母数字下划线
    - 对大小写敏感
  + 单多行注释：
    - 单行注释：`//`
    - 多行注释：`/* */`
  + 我们一般喜欢说：“创建一个变量”，甚至说“实例化一个变量”。
    - 创建变量之后我们会通过赋值语句赋值：`int a = 10;`
    - 赋值语句的格式为：`变量名 = 变量值;`
    - 变量名可以是任意合法的标识符，变量值可以是任意合法的表达式。
    - 变量名和变量值之间用等号`=`连接，等号的左边是变量名，右边是变量值。
    - 赋值语句可以在程序的任何地方使用，包括在主函数中、代码块中、循环中、函数中等。
    - 赋值语句可以用来修改变量的值，也可以用来初始化变量。
    - 赋值语句可以用来将一个变量的值赋给另一个变量。
    - 但是在后续代码中再赋值时,`int a = 10;`中的`int`不要再写出来，否则会报错。
    - 例如：
      ```cpp
      int a = 10;
      a = 20;
      ```
      不会报错，但是：
      ```cpp
      int a = 10;
      int a = 20;
      ```
      会报错，提示`重定义标识符“a”`。原因是`int`是定义变量的声明，不能重复定义。
== 1.3.浮点数
    ```cpp
    #include <iostream>
    using namespace std;
    int main()
    {
      //单精度float 双精度double 单精度数字后面一般加一个f，有效位为8，双为15或16
      //默认只显示6位。
      float a = 3.14f;double b = 3.14;
      cout << "a的值为：" << a << endl;
      cout << "b的值为：" << b << endl;
      cout << "size of a =" << sizeof(a) << endl;cout << "size of b =" << sizeof(b) << endl;
      //科学计数法：e后面的数字为10^几次方
      float f1 = 3e2;float f2 = 3e-2;
      cout << "f1=" << f1 << endl;cout << "f2=" << f2 << endl;
      system("pause");
      return 0;
    }
    ```
    运行结果：
    ```bash
    a的值为：3.14
    b的值为：3.14
    size of a =4
    size of b =8
    f1=300
    f2=0.03
    ```
    浮点数分为单精度和双精度，单精度用`float`表示，双精度用`double`表示。
    单精度有效位为8位，双精度有效位为15或16位。
    单精度数字后面一般加一个`f`，例如`3.14f`。
    例如：
    ```cpp
    float a = 3.14f;
    double b = 3.14;
    ```
    我们还可以使用科学计数法表示浮点数，例如：
    ```cpp
    float a = 3e2;float b = 3e-2;
    ```
    这里的`3e2`表示$3*10^2$，即`300`。
    这里的`3e-2`表示$3*10^(-2)$，即`0.03`。
== 1.4.字符型
    ```cpp
    #include <iostream>
    using namespace std;
    int main()
    {
      char ch_1 = 'a';//只能有一个字符,只能用单引号
      cout << ch_1 << endl;
      cout << sizeof(ch_1) << endl;
      cout << (int)ch_1 << endl;//查ASCII码
      system("pause");
      return 0;
    }
    ```
    运行结果：
    ```bash
    a
    1
    97
    ```
    由此可以看出单字符的数据类型为char,其大小为1字节,可以调用`(int)ch_1`将字符转换为对应的ASCII码。但本质上`(int)`是强制类型转换，可以用在某些场景下，如将字符转换为数字，将浮点数转换为整数等。此事`C`中亦有记载。
== 1.5.转义符
    ```cpp
    #include <iostream>
    using namespace std;
    int main()
    {
      //转义符常用的：\n:换行 \t:水平制表，去下一个tab,\t前面有n个字符就会生成8-n个空格 \\:表示一个\

      cout<<"hello world\n1234567\n7654321"<<endl;

      cout << "a\n\tb\n\t\tc\n\t\t\td" << endl;
      system("pause");

      return 0;
    }
    ```
    运行结果：
    ```bash
    hello world
    1234567
    7654321
    a
      b
        c
          d
    ```
    以下为`C++`的转义符：
    - `\n` 换行
    - `\t` 水平制表
    - `\\` 表示一个`\`
    - `\"` 表示一个`"`
    - `\'` 表示一个`'`
    - `\0` 表示一个`NULL`字符
    - `\a` 表示一个`alert`字符
    - `\b` 表示一个`backspace`字符
    - `\f` 表示一个`form feed`字符
    - `\r` 表示一个`carriage return`字符
    - `\v` 表示一个`vertical tab`字符
    - `\t` 表示一个水平制表符
    - `\xhh` 表示一个十六进制数为`hh`的字符
    - `\0hh` 表示一个八进制数为`hh`的字符
    只需掌握`\n`,`\t`和`\\`即可。反斜杠+字母的形式可以表示不同程度的转义符。转义符的作用是告诉编译器，这个字符不是普通的字符，而是一个特殊字符。并且产生一些特殊效果。
== 1.6.字符串型
  字符型和字符串型最大的不同是字符串型可以存储多个字符，而字符型只能存储一个字符。
  ```cpp
  #include <iostream>
  #include <string>
  using namespace std;
  int main()
  {
    char a[] = "helloworld";
    cout << a << endl;
    //用双引号，char格式要[]

    string str1 = "sidnziocnoszfisdficjszcs";
    //要包含头文件#include <string>如第二行
    cout << str1 << endl;

    system ("pause");

    return 0;
  }
  ```
  运行结果：
  ```bash
  helloworld
  sidnziocnoszfisdficjszcs
  ```
  字符串型的定义方式有两种：
  - 字符数组
  - `string`类
  字符数组的定义方式为：
  ```cpp
  char a[] = "hello world";
  ```
  字符串类的定义方式为：
  ```cpp
  string str1 = "hello world";
  ```
  字符串类的定义方式需要包含头文件`#include <string>`。
  字符串类的定义方式需要用双引号，而字符数组的定义方式需要用单引号。
  字符串类的定义方式需要用`string`关键字，而字符数组的定义方式不需要用`string`关键字。
  字符串类的定义方式需要用`endl`换行，而字符数组的定义方式需要用`\n`换行。
  字符串类的定义方式需要用`cout`输出，而字符数组的定义方式需要用`printf`输出。
  字符数组的定义方式可以看看`C`语言中的字符串定义方式。
== 1.7.布尔型
  布尔型`bool`表示一个布尔值，有`true`和`false`两个值。经常用于循环下的条件判断中，`C`语言中也有类似方法。通过`return 0或1`作为循环是否继续的条件。
  ```cpp
  #include <iostream>
  using namespace std;
  int main()
  {
    bool a = true;
    bool b = false;
    cout << a << endl;
    cout << b << endl;
    cout << sizeof(a) << endl;
    cout << sizeof(b) << endl;
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  1
  0
  1
  1
  ```
  可以看出`bool`型的大小为1字节，`true`的值为1，`false`的值为0。
  布尔型的应用场景：
  - 循环下的条件判断
  - 函数的返回值
  - 变量的赋值
  布尔型的注意事项：
  - 布尔型的大小为1字节
  - 布尔型的取值为`true`或`false`
  - 布尔型的变量只能赋值为`true`或`false`
  - 布尔型的变量可以用`cout`输出
  - 布尔型的变量可以用`scanf`输入
== 1.8.输入流
  输入流`cin`是`C++`中的输入流，用于从键盘输入数据。`cin`是`iostream`库中的一个对象，用于从标准输入流中读取数据。
  输入流`cin`的常用操作有：
  - `cin >> 变量名`：从标准输入流中读取一个数据，并将其赋值给变量名。
  - `cin.get(变量名)`：从标准输入流中读取一个字符，并将其赋值给变量名。
  - `cin.getline(变量名, 长度)`：从标准输入流中读取一行数据，并将其赋值给变量名。
  可以对标`C`语言中的`scanf`函数。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    //整形,浮点型
    int a = 0;
    cout << "请给a赋值：" << endl;
    cin >> a;
    cout << "啊的值为：" << a << endl;
    system("pause");
    //字符型
    char str = 'a';cout << "请给str赋值：" << endl;
    cin >> str;
    cout << str << endl;
    system("pause");
    //字符串型，布尔型也一样，输入的非零就代表真
    char jjjjjjj[] = "fefb";cout << "请给jjjjjjj赋值：" << endl;
    cin >> jjjjjjj;
    cout << jjjjjjj << endl;
    system("pause");
    return 0;
    }
  ```
运行结果：
  ```bash
  请给a赋值：
  1
  a的值为：1
  请给str赋值：
  b
  b
  请给jjjjjjj赋值：
  c
  c
  ```
== 1.9.运算符
  运算符`+`、`-`、`*`、`/`、`%`、`=`、`==`、`!=`、`<`、`>`、`<=`、`>=`、`&&`、`||`、`!`、`&`、`|`、`^`、`~`、`<<`、`>>`、`?`、`:`、`sizeof`、`new`、`delete`、`[]`、`()`、`->`、`::`、`:`、`->*`、`.*`、`typeid`、`dynamic_cast`、`const_cast`、`reinterpret_cast`、`static_cast`等。初阶教程只介绍常见的：
  ```cpp
  #include <iostream>
  using namespace std;
  int main() 
  {
    //+-*与/加减乘除运算符,/为整除，会除去小数部分
    int a1 = 10;int a2 = 5;
    cout << a1 + a2 << endl;
    cout << a1 - a2 << endl;
    cout << a1 * a2 << endl;
    cout << a1 / a2 << endl;
    double b1 = 0.5;double b2 = 0.23;
    cout << "0.5/0.23=" << b1 / b2 << endl;
    //%为取余,小数不能取余
    int c1 = 10;int c2 = 3;
    cout << "10/3的余数为" << c1 % c2 << endl;
    //前后置递增，递减
    int a = 10;int b = 10;
    a++;++b;
    cout << a << "          " << b << endl;
    //前置后置的区别，前置时变量加一再进行运算，后置时运算后加一,递减同理
    int z = 10;
    int c = ++z * 10;
    cout << z << endl;
    int d = z++ * 10;//运行结束后z=10+1+1 c为10*（10+1）d为11*10
    cout << z << endl;
    cout << c <<"      ^_^       "<< d << endl;
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  15
  5
  50
  2
  0.5/0.23=2.17391
  10/3的余数为1
  11          11
  11
  12
  110      ^_^       110
  ```
  尤其注意：`int c =  ++z * 10;`，`++z`是先加再进行后续运算，意思是`z=z+1`，然后再进行$11*10=110$。而对于`int d = z++ * 10;`，`z++`是先进行后续运算，然后再加一。即`z*10=110`后再`z=z+1`。运行结束后`z=10+1+1`，`c`为`10*（10+1）`，`d`为`11*10`。
  - 取模运算符：`%`，它的经常被用于生成一个范围内的随机数。因为模余输出的数不可能比除数大，通过设立随机数种子并取模余，可以生成0到除数-1范围内的随机数。