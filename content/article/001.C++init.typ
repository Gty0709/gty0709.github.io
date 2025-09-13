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
= 1.`C++`语法基础
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
== 1.10.赋值运算符
  赋值运算符`=`，将右边的值赋给左边的变量。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    int a = 0;
    a = 10;//对a赋值了
    a += 2;//a=a+2
    cout << a << endl;
    a %= 2;
    cout << a << endl;
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  12
  0
  ```
  - 除此以外还有：
    - `+=`
    - `-=`
    - `*=`
    - `/=`
    - `%=`
  这些算符本质都是一样的，如果`a`是`int`类型，那么`a+=2`等价于`a=a+2`，其它符号则换成对应的运算符即可。
== 1.11.比较算符
  比较算符`==`、`!=`、`<`、`>`、`<=`、`>=`，用于比较两个数的大小关系，返回值为`bool`类型，即`true`或`false`。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    int a = 4; int b = 3;
    cout << (a == b) << endl;
    cout << (a != b) << endl;
    cout << (a > b) << endl;
    cout << (a < b) << endl;
    cout << (a >= b) << endl;
    cout << (a <= b) << endl;
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  0
  1
  1
  0
  1
  0
  ```
  逻辑运算符的优先级高于关系运算符，因此先执行逻辑运算符。
== 1.12.逻辑运算符
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    int a = 10;int b = 11;int c = 0;
    cout << !a << endl;
    cout << !!a << endl;//！a表示非a，！！a表示非非a，即a，此时a为一个命题，而不是单纯的变量赋值
    //&&表示逻辑与，就是a和b
    cout << (!a && !b) << endl;
    cout << (!a && b) << endl;
    cout << (a && b) << endl;//当中若a=0，则a直接为假
    cout << "_________________________________________" << endl;
    cout << (a && c) << endl;
    cout << (a && !c) << endl;
    //||表示逻辑或，就是a或b
    cout << "_________________________________________" << endl;
    cout << (a || b) << endl;
    cout << (a || !b) << endl;
    cout << (!a || !b) << endl;
    cout << (a || c) << endl;
    cout << (!a || c) << endl;
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  0
  1
  0
  0
  1
  0
  1
  1
  1
  0
  1
  0
  ```
  逻辑或非与的具体运算规则可以参考离散数学。两个命题有且仅有一个为假则与命题为假，或命题为真；两命题均真均假则逻辑或与同真假。
== 1.13.条件语句
=== 1.13.1.单行`if`语句
  条件语句关键字`if`，首先是单行`if`语句。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    //条件语句的应用，if，首先是单行if语句
    //输入分数，大于600为一本
    int a = 0;
    cout<<"请输入你的分数：" << endl;
    cin >> a;
    cout << "你的分数：" <<a<< endl;
    if (a > 600) 
    {
      cout << "恭喜上了一本" << endl;
    }//注意。if后面不要加分号，否则条件白写。
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  请输入你的分数：
  600
  你的分数：600
  恭喜上了一本
  ```
  请注意：
  - `if`语句后面的大括号`{}`不能省略，否则会报错。
  - `if`语句后面的条件表达式请不要加分号。
  - `if`语句最好换行写，这样清晰些。
=== 1.13.2.`if-else`语句
  `if-else`语句是`if`语句的扩展，它可以处理两种情况。
  示例：
  ```cpp
  #include <iostream>
  using namespace std;
  int main()
  {
    int score;
    cout << "请输入你的分数：" << endl;
    cin >> score;
    cout << "你的分数：" << score << endl;
    if (score >= 600)
    {
      cout << "恭喜上了一本" << endl;
    }
    else
    {
      cout << "请重新考试" << endl;
    } 
    system("pause");
    return 0;
  }
  ```
    运行结果：
    ```bash
    请输入你的分数：
    600
    你的分数：600
    恭喜上了一本
    ```
    运行结果：
    ```bash
    请输入你的分数：
    500
    你的分数：500
    请重新考试
    ```
    `else`下执行语句会被执行当且仅当`if`的条件不被满足。
=== 1.13.3.多条件语句
  多条件语句`if...else if...else`：允许多个条件判断，当多个条件满足时，执行第一个满足条件的条件块。
  ```cpp
  #include <iostream>
  using namespace std;
  int main()
  {
    int score;
    cout << "请输入你的分数：" << endl;
    cin >> score;
    if (score >= 90)
    {
      cout << "你的分数：" << score << endl;
      cout << "恭喜上了一本" << endl;
    }
    else if (score >= 60)
    {
      cout << "你的分数：" << score << endl;
      cout << "恭喜上了二本" << endl;
    }
    else
    {
      cout << "请重新考试" << endl;
    }
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  请输入你的分数：
  90
  你的分数：90
  恭喜上了一本
  ```
  运行结果：
  ```bash
  请输入你的分数：
  80
  你的分数：80
  恭喜上了二本
  ```
  运行结果：
  ```bash
  请输入你的分数：
  50
  你的分数：50
  请重新考试
  ```
  多条件语句`if...else if...else`的注意事项：
  - `if`语句后面的大括号`{}`不能省略，否则会报错。
  - `if`语句后面的条件表达式请不要加分号。
  - `if`语句最好换行写，这样清晰些。
  + 注意满足第一个条件后后续的执行语句是假执行，不会被执行。当满足条件执行一次执行语句之后，会自动跳出条件判断语句框。
  + 我们也可以直接在执行语句内使用`return`，需要注意的是，这样将直接跳出一整个函数而不仅是条件语句。
=== 1.13.4.嵌套条件语句
  嵌套条件语句是执行语句内再嵌套一层条件语句。常用于复杂的条件判断过程。
  嵌套条件语句的格式如下：
  ```c++
  if(条件1){
      if(条件2){
          执行语句1;
      }else{
          执行语句2;
      }
  }else{
      执行语句3;
  }
  ```
  具体代码如下：
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    cout << "请输入高考分数：" << endl;
    int a = 0;
    cin >> a;
    cout << "您输入的高考分数是：" << a << endl;
    if (a > 600) { 
      cout << "恭喜考入一本大学" << endl;
      if (a > 700) {
        cout << "太强了，上清北" << endl;
      }
      else if (a > 650) {
        cout << "华中五校任调" << endl;
      }
      else { cout << "双一流基本稳了" << endl; }
    }
    else if (a > 500) { 
      cout << "恭喜你考入二本大学" << endl; 
    }
    else if (a > 400) { 
      cout << "恭喜你考入san本大学" << endl; 
    }
    else { 
      cout << "请重新考试。" << endl; 
    }
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  请输入高考分数：
  600
  您输入的高考分数是：600
  恭喜考入一本大学
  双一流基本稳了
  ```
=== 1.13.5.条件语句练习
  小猪称重，要求输入三只小猪的重量，并判断出哪个小猪最重。
  具体代码如下：
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    int a, b, c;
    cout << "请输入三只小猪的重量：" << endl;
    cin >> a >> b >> c;
    if (a > b && a > c) {
      cout << "小猪A最重" << endl;
    }
    else if (b > a && b > c) {
      cout << "小猪B最重" << endl;
    }
    else if (c > a && c > b) {
      cout << "小猪C最重" << endl;
    }
    else {
      cout << "输入错误" << endl;
    }
    system("pause");
    return 0;
  }
  ```
  输入流`cin`可以连续输入，每输入一次换一行即可。
  运行结果：
  ```bash
  请输入三只小猪的重量：
  100 200 300
  小猪C最重
  ```
=== 1.13.6.三目运算符
  三目运算符`? :`，三目运算符的语法格式为：`condition ? true : false`。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    //三目运算符：A？B：C，简单的if else语句，A为真执行B，A为假执行C
    int a = 30;
    int b = 20;
    int c = 0;
    c = ((a > b) ? a : b);
    cout << c << endl;
    //三目运算符返回的是变量，可以继续赋值
    (a > b ? a : b) = 100000;
    cout << a << endl;
    cout << b << endl;
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  30
  100000
  20
  ```
  本质上还是一个条件判断语句，只是将判断语句和执行语句写在一行，方便简洁。
=== 1.13.7.`switch...case...`语句
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    //给电影打分10-9好，9以下垃圾
    //缺点：只能判断整型和字符型，不能判断区间，但是if可以
    cout<<"请给电影打分：" << endl;
    int a = 0;
    cin >> a;
    switch (a) {
    case 10:
      cout<<"经典" << endl;
      break;//break是断开当前分支
    case 9:
      cout << "经典" << endl;
      break;
    default:
      cout << "垃圾" << endl;
      break;
    }
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  请给电影打分：
  10
  经典
  ```
  运行结果：
  ```bash
  请给电影打分：
  9
  经典
  ```
  运行结果：
  ```bash
  请给电影打分：
  8
  垃圾
  ```
  这段代码缺点在于没法判断整数，不适合用于分数。但适合用于程序入口涉及选数字进入不同函数的逻辑。如在某些游戏中。
== 1.14.循环
=== 1.14.1.`while`循环
  `while`循环的语法格式为：
  ```cpp
  while(条件){
      执行语句;
  }
  ```
  具体代码如下：
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    int a = 0;
    while (a < 10) {
      cout << a << endl;
      a++;
    }
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
  ```
=== 1.14.2.猜数字游戏实现
  现在需要实现一个功能，电脑生成一个1到100间的随机数，然后玩家猜这个数字，每猜一次就电脑就提示偏大偏小或相等。通过这个过程最终引导玩家猜中数字。
  具体代码如下：
  ```cpp
  #include <iostream>
  #include <ctime>//引用时间库
  using namespace std;
  int main() {
    srand((unsigned int)time(NULL));//防止每一次打开都是同一个数字
    int a = rand() % 100 + 1;//1-100
    int b = 0;
    while (1) {
      cout << "请输入一个0-100间的整数：" << endl;
      cin >> b;
      if (b > a) {
        cout << "太大了" << endl;
      }
      else if (b < a) {
        cout << "太小了" << endl;
      }
      else {
        cout << "猜对了，666666666666666666666" << endl;
        break;
      }
    };
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  请输入一个0-100间的整数：
  50
  太大了
  请输入一个0-100间的整数：
  25
  太大了
  请输入一个0-100间的整数：
  12
  太小了
  请输入一个0-100间的整数：
  17
  太小了
  请输入一个0-100间的整数：
  22
  太小了
  请输入一个0-100间的整数：
  23
  太小了
  请输入一个0-100间的整数：
  24
  猜对了，66666666666666
  ```
  - 随机数生成模块：
    ```cpp
    srand((unsigned int)time(NULL));//防止每一次打开都是同一个数字
    int a = rand() % 100 + 1;//1-100
    ```
    `srand`函数是用来生成随机数的，`time(NULL)`函数是用来获取当前时间的，`(unsigned int)`是用来将时间转换为无符号整数的，`% 100 + 1`是通过取余数的方式生成1-100的随机数。这段代码将是随机数生成方式的典范。使用`time`需要包含`ctime`头文件。
  - 循环条件：
    `while (true)`或`while (1)`是一个死循环，一般用于需要在特定情况下退出循环的场景。
  - 条件语句下的`break`：
    `if(){break;}`结构中，可以跳出外层循环，因为条件语句本身无需`break`跳出，而加入`break`后，外侧第一层循环将被跳出。牢记不同嵌套下`break`的作用。
  - `cin>>`与循环的嵌套：
    适用于需要不断输入的场景。
=== 1.14.3.猜数字另解
  ```cpp
  #include <iostream>
  #include <ctime>//引用时间库
  using namespace std;
  int main() {
    srand((unsigned int)time(NULL));//防止每一次打开都是同一个数字
    int a = rand() % 100 + 1;//1-100
    int b = 0;
    cout << "请输入一个0-100间的整数：" << endl;
    cin >> b;
    while (b!=a) {
      if (b > a) {
        cout << "太大了" << endl;
      }
      else if (b < a) {
        cout << "太小了" << endl;
      };
      cout << "请输入一个0-100间的整数：" << endl;
      cin >> b;
    };
    cout << "猜对了，666666666666666666666" << endl;
    system("pause");
    return 0;
  }
  ```
  此处有一个耐人寻味的点，`while (b!=a)`中，`!=`是不等于的意思，这个条件判断返回的是一个布尔类型的值，也就是`true`或者`false`。很多项目开发中也经常会使用此技巧来控制循环的。
  === 1.14.4.`do...while`循环
  `do...while`循环和`while`循环类似，但是`do...while`循环至少会执行一次，`while`循环不一定会执行一次。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    //while循环
    int a = 0;
    while (a < 10) {
      cout << a << endl;
      a += 1;
    };
    system("pause");
    //do while 循环
    int b = 0;
    do {
      cout << b << endl;
      b += 1;
      if (b == a) {
        break;
      }
    } while (b);
    system("pause");
    b = 0;
    while(b) {
      cout << b << endl;
      b += 1;
      if (b == a) {
        break;
      }
    }
    //区别在于while(变量)，当变量=0时，do while先执行语句，不为零则为真，循环会一直继续，但while会直接判断为假，不执行循环。
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
  ```
  为什么第三个循环没有出现呢？
  因为第三个循环的变量`b=0`，而`while(b)`判断为假，所以不会执行循环。但为什么第二个循环执行了？因为`do{}while()`会先执行一次循环，然后再判断变量是否为真，为真则继续循环，为假则结束循环。本例中，`b=0`但在`do`中直接加了1，因此到条件判断时加了1后`b=1`，因此循环继续执行。
  - 细品这两个写法的不同，并分别确认适用于什么地方。
=== 1.14.5.水仙花数的练习
  - 找出100到1000的水仙花数，满足个位的立方+十位的立方+百位的立方=其本身。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    int a = 100;
    int n1 = 0;
    int n2 = 0;
    int n3 = 0;
    while (a < 1000) {
      n1 = a % 10;
      n2 = a / 10 % 10;
      n3 = a / 100;
      if (n1*n1*n1+n2*n2*n2+n3*n3*n3== a) {
        cout << a << endl;
      };
      a += 1;
    };
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  153
  370
  371
  407
  ```
  值得注意的一个点
  - 取出一个数的各个位置：可以用上述取余的方法。 
=== 1.14.6.`for`循环
  `for`循环是一种常用的循环结构，它的语法如下：
  ```cpp
  for (初始化; 条件; 增量) {
    // 循环体
  }
  ```
  其中，初始化是在循环开始前执行的，条件是在每次循环开始前判断的，增量是在每次循环结束后执行的。
  例如，下面的代码使用`for`循环输出1到10的数字：
  ```cpp
  for (int i = 1; i <= 10; i++) {
    cout << i << endl;
  }
  ```
  运行结果：
  ```bash
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  ```
  养成良好编程习惯，`for`循环开始之前先声明循环变量，避免循环体中使用未初始化的变量。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    //for循环:for（起始表达式；末尾表达式；条件循环体）
    for (int i = 0;i < 10;i++) {
      cout << i << endl;
    };
    system("pause");
    int j = 0;//声明循环变量
    for (;j < 10;j++) {
      cout << j << endl;
    };
    system("pause");
    return 0;
  }
  ```
  输出结果：
  ```bash
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
  ```
=== 1.14.7.循环的嵌套
  循环的嵌套是指一个循环内部包含另一个循环。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    for (int i = 0;i < 10;i++) {
      for (int j = 0;j < 10;j++) {
        cout << "* ";//无endl不换行。
      }
      cout<<endl;//直接换行
    }
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * *
  * * * * * * * * * * 
  ```
=== 1.14.8.乘法表
  例如，下面的代码使用两个循环打印出1到10的乘法表：
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    for (int i = 1;i < 10;i++) {
      for (int j = 1;j < i + 1;j++) {
        if (i * j < 10) {
          cout << i << "*" << j << "=" << i * j << "   ";
        }
        else {
          cout << i << "*" << j << "=" << i * j << "  ";
        }//if else用于对齐数字
      }
      cout << endl;
    }
    system("pause");
    return 0;
  }
  ```
  运行结果：
  ```bash
  1*1=1
  2*1=2   2*2=4
  3*1=3   3*2=6   3*3=9
  4*1=4   4*2=8   4*3=12  4*4=16
  5*1=5   5*2=10  5*3=15  5*4=20  5*5=25
  6*1=6   6*2=12  6*3=18  6*4=24  6*5=30  6*6=36
  7*1=7   7*2=14  7*3=21  7*4=28  7*5=35  7*6=42  7*7=49
  8*1=8   8*2=16  8*3=24  8*4=32  8*5=40  8*6=48  8*7=56  8*8=64
  9*1=9   9*2=18  9*3=27  9*4=36  9*5=45  9*6=54  9*7=63  9*8=72  9*9=81
  ```
=== 1.14.9.`break`和`continue`
  - `break`用于退出`switch`中`case`，用于退出当前`for`、`while`循环，或者退出嵌套循环。
  - `continue`用于跳过当前循环中剩下的语句，继续执行本层循环。
  例子如下：
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    for (int i = 0;i < 10;i++) {
      for (int j = 0;j < 10;j++) {
        if (j > 5) {
          cout << "&" << endl;
          break;
        }
        cout << "*";
      }
    }
    system("pause");
    for (int a = 0;a < 10;a++) {
      for (int b = 0;b < 10;b++) {
        if (b > 5) {
          cout << "&" << endl;
          continue;
        }
        cout << "*";
      }
    }
    return 0;
  }
  ```
  运行结果：
  ```bash
  ******&
  ******&
  ******&
  ******&
  ******&
  ******&
  ******&
  ******&
  ******&
  ******&
  请按任意键继续. . .
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ******&
  &
  &
  &
  ```
  - `cout`用于输出，`endl`用于换行。因此没有`endl`的情况下就不会换行。可以用于连续同一行打印字符。
  - 同一层循环内，`break`和`continue`都可以使当前层内的后续代码不被执行，换而言之，可以跳出当前层循环。但区别在于，`break`会跳出当前层循环，而`continue`只会跳出当前层循环的当前次循环，继续执行下一次循环。
== 1.15.`goto`语句
  用于跳转到代码任意位置。一般少用，不然很容易出`bug`。
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    for (int i = 0;i < 101;i++) {
      if (i % 2 == 0) {
        continue;
      }
      else {
        cout << i << endl;
      };
      if (i > 11) {
        goto T;
      }
    }
  T:
    cout << "6666666" << endl;
    system("pause");
    return 0;
  }
  ```
  输出：
  ```bash
  1
  3
  5
  7
  9
  11
  6666666
  ```
  可以看到在11后面函数被截断了，这是因为我们使用了`goto`语句，将程序跳转到了`T`的位置。
  但是，`goto`语句的使用是非常危险的，因为它可以使程序跳转到任意位置，而不是只能跳转到当前函数内的位置。因此，在使用`goto`语句时，必须非常小心，避免跳转到错误的位置，导致程序出错。
== 1.16.数组
  - 数组是一种数据结构，用于存储相同类型的多个元素。
  - 数组的每个元素都有一个唯一的索引，用于访问该元素。
  - 数组的索引从0开始，因此第一个元素的索引为0，第二个元素的索引为1，以此类推。
  - 数组的长度是固定的，一旦创建，就不能改变。
  - 数组的元素可以是任何类型，包括基本类型（如int、float、double等）和复合类型（如结构体、数组等）。
=== 1.16.1.一维数组与数组名
  ```cpp
  #include<iostream>
  using namespace std;
  //主要讲解三种数组创建方法
  int main() {
    int a[] = { 1,2,3,4,5,6,7,8,9,10 };
    for (int i = 0;i < 10;i++) {
      cout << a[i] << endl;
    };
    system("pause");
    int b[7] = { 1,2 };//长度为7，剩下的用0补足
    for (int i = 0;i < 7;i++) {
      cout << b[i] << endl;
    };
    system("pause");
    int c[6] = {};
    c[0] = 1;
    c[1] = 2;
    c[2] = 3;
    for (int i = 0;i < 6;i++) {
      cout << c[i] << endl;
    };
    system("pause");
    //数组名。
    cout << sizeof(a) << endl;//查看数组a的内存空间大小
    cout << sizeof(a[0]) << endl;//查看数组第一个元素的大小
    cout << sizeof(a) / sizeof(a[0]) << endl;//由于数组元素类型相同所以用于计算一个数组元素个数
    cout << a << endl;//查看16进制下数组的存放地址，在数组前加“（int）”可以查询10进制
    cout << &a[0] << endl;//查看16进制下数组的第一个元素放在哪里，看十进制的同上
    return 0;
  }
  ```
  输出：
  ```bash
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  请按任意键继续. . .
  1
  2
  0
  0
  0
  0
  0
  请按任意键继续. . .
  1
  2
  3
  0
  0
  0
  请按任意键继续. . .
  40
  4
  10
  0000003E9C57F8C8
  0000003E9C57F8C8
  ```
  - 多种声明方式：
    +  `int a[]={1,2,3,4,5,6,7,8,9,10}`
    +  `int a[10]={1,2,3,4,5}`
    +  `int a[10]={}; a[0]=1; a[1]=2; a[2]=3;`
  - 访问数组元素：`a[0]`  
  - 数组大小：`sizeof(a)/sizeof(a[0])`此为后续求数组大小的范式。
  - 数组名：`a`
    + 数组名是一个常量指针，指向数组的第一个元素。
    + 数组名不能被赋值。
    + 数组名不能被修改。
    + 数组名不能被递增或递减。
    + 数组名不能被比较。
    + 数组名不能被作为参数传递。
    + 数组名不能被作为返回值传递。
    因此，计算数组的长度`sizeof(a)/sizeof(a[0])`不要在自己设定的函数中使用。否则传参计算后发现值恒为1。
=== 1.16.2.找最值算法
  小猪们的体重保存到一个数组，请找到最重的小猪的编号和体重。
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    //五只小猪体重以数组的方式保存，找出最重的那只
    int x = 0;int y = 0;
    int a[] = { 100,600,200,700,400,500,300,900,0 };
    for (int i = 0;i < sizeof(a) / sizeof(a[0]) - 1;i++) {
      for (int j = i + 1;j < sizeof(a) / sizeof(a[0]);j++) {
        if (a[i] > a[j]) {
          if (j != sizeof(a) / sizeof(a[0]) - 1) {
            continue;
          }
          else {
            x = i + 1;y = a[i];
            cout << "第" << x << "只猪最重,重" << a[i] << endl;
            break;
          };
        }
        else {
          break;
        };
      };
      if (x != 0) {
        break;
      };
    };
    system("pause");
    //另外一种方法
    int max = 0;int num = 0;
    int b[] = { 100,600,200,700,400,500,300,900 };
    for (int k = 0;k < sizeof(b) / sizeof(b[0]);k++) {
      if (b[k] > max) {
        max = b[k];num = k + 1;
      }
    }
    cout << "第" << num << "只小猪最重，重" << max << endl;
    system("pause");
    return 0;
  }
  ```
  - 方法一：遍历数组，嵌套循环的方式，比较第i个猪体重和后续所有猪体重，找出最大值。
  - 方法二：创建一个最大值变量，并赋值为数组的第一个值，然后遍历数组，将最大值和后续的元素进行比较，找出最大值。显然第二种方法的复杂度更低。第二种方法将是没有库函数的情况下使用的最优解。
=== 1.16.3.逆置算法
  逆置算法，将数组的元素逆置，即将第一个元素和最后一个元素进行交换，第二个元素和倒数第二个元素进行交换，依次类推，直到中间位置。
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    int arr[] = { 1,2,5,6,8,9,6,5,4,3,6,7,8,9,2 };
    int temp = 0;
    int start = 0;int end = sizeof(arr)/sizeof(arr[0])-1;
    while (start < end) {
      temp = arr[start];
      arr[start] = arr[end];
      arr[end] = temp;
      start++;end--;
    }
    for (int i = 0;i < sizeof(arr) / sizeof(arr[0]);i++) {
      cout << arr[i] << " ";
    }
    cout << "" << endl;
    system("pause");
    return 0;
  }
  ```
  输出：
  ```bash
  2 9 8 7 6 3 4 5 6 9 8 6 5 2 1
  请按任意键继续. . .
  ```
  通过构建两个标记，一个标记从数组的开头开始，一个标记从数组的结尾开始，两个标记向中间移动，直到相遇，数组就被逆置了。
=== 1.16.4.冒泡排序法
  冒泡排序法，是一种排序算法，它的原理是比较两个相邻的元素，将较大的元素交换到后面，较小的元素交换到前面，一次比较完成后，最大的元素就被交换到了最后面，然后再对剩余的元素进行比较，直到所有的元素都被排序完成。
  冒泡排序法的时间复杂度为O($n^2$)，空间复杂度为O(1)。
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    int arr[] = { 1,4,6,9,3,6,2,5,8,7,4,5,9,8,2,2,4,6,7,3,2,2,1,6 };
    int end = sizeof(arr) / sizeof(arr[0])-1;
    for (int i = 0;i < sizeof(arr) / sizeof(arr[0]);i++) {
      for (int j = 0;j < end;j++) {
        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        };
      };
      end--;
    };
    for (int k = 0;k < sizeof(arr) / sizeof(arr[0]) ;k++) {
      cout << arr[k];
    };
    system("pause");
    return 0;
  }
  ```
  输出：
  ```bash
  11222223344455666677888999请按任意键继续. . .
  ```
=== 1.16.5.二维数组
  可以理解为是一个矩阵，每个元素都有一个行号和列号。$T in RR^2$
  ```cpp
  /*
  1. 数据类型  数组名[ 行数 ][ 列数 ]; 
  2. `数据类型  数组名[ 行数 ][ 列数 ] = { {数据1，数据2 } ，{数据3，数据4 } };
  3. `数据类型  数组名[ 行数 ][ 列数 ] = { 数据1，数据2，数据3，数据4};
  4. ` 数据类型  数组名[  ][ 列数 ] = { 数据1，数据2，数据3，数据4};
  */
  #include <iostream>
  using namespace std;
  int main() {
    //1
    int arr1[2][3];
    arr1[0][0] = 0;
    arr1[0][1] = 1;
    arr1[0][2] = 2;
    arr1[1][0] = 3;
    arr1[1][1] = 4;
    arr1[1][2] = 5;
    //2
    int arr2[2][3] = { 
      {0,1,2},
      {3,4,5} 
    };
    //3
    int arr3[2][3] = { 0,1,2,3,4,5 };
    //4
    int arr4[][3] = { 0,1,2,3,4,5 };
    //嵌套循环输出结果。
    for (int i = 0;i < 2;i++) {
      for (int j = 0; j < 3;j++) {
        cout << arr1[i][j] << " ";
      };
      cout << "" << endl;
    };
    system("pause");
    return 0;
  }
  ```
  - 上述代码已经附上4种二维数组的初始化方式，需要注意的是，无论如何省略，始终不能缺少列数。因为在内存分配中，是按照列数去对数组进行分割。缺少列数将使得不知何处截断，最终报错。
  - 数组元素会用0自动补全，因此不需要全部输入。
=== 1.16.6.二维数组名与内存
  数组名传参时永远传的是首元素地址。除了`sizeof`中是整个数组。
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    int arr[2][3] = {
      {1,2,3},
      {4,5,6}
    };
    cout << sizeof(arr) << endl;
    //输出结果为4×6=24；若int换成double，则结果为48
    cout << sizeof(arr[0]) << endl;//查看第一行占的内存空间
    cout << sizeof(arr[0][0]) << endl;//查看第一个数据内存空间
    cout << "二维数组的行数为：" << sizeof(arr) / sizeof(arr[0]) <<
      ",二维数组的列数为：" << sizeof(arr[0]) / sizeof(arr[0][0]) << "。" << endl;
    cout << "二维数组的首地址在16进制下为：" << arr <<
      ",在10进制下表示为" << (int)arr << endl;
    cout << (int)arr[0] << "  " << (int)arr[1] << endl;//差12，因为每一行三个数据占3×4=12个字节
    cout << (int)&arr[0][0] << "  " << (int)&arr[0][1] << endl;//差4，每个整形4个字节
    system("pause");
    return 0;
  }
  ```
  结果输出：
  ```bash
  24
  12
  4
  二维数组的行数为：2,二维数组的列数为：3。
  二维数组的首地址在16进制下为：000000BC6DAFF768,在10进制下表示为1840248680
  1840248680  1840248692
  1840248680  1840248684
  请按任意键继续...
  ```
  - 计算二维数组的行数：`sizeof(arr) / sizeof(arr[0])`
  - 计算二维数组的列数：`sizeof(arr[0]) / sizeof(arr[0][0])`
  - 计算二维数组的元素个数：`sizeof(arr) / sizeof(arr[0][0])`
  - 查看一行占的空间：`sizeof(arr[0])`
  - 查看一个元素占的空间：`sizeof(arr[0][0])`
=== 1.16.7.二维数组例子
  ```cpp
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
    int arr[3][3] = {
      {100,100,100},
      {90,50,100},
      {60,70,80}
    };
    cout << "张三的成绩为" << arr[0][0] + arr[0][1] + arr[0][2] << endl;
    cout << "李四的成绩为" << arr[1][0] + arr[1][1] + arr[1][2] << endl;
    cout << "王五的成绩为" << arr[2][0] + arr[2][1] + arr[2][2] << endl;
    //循环实现
    string names[3] = { "张三","李四","王五" };
    for (int i = 0;i < 3;i++) {
      int sum = 0;
      for (int j = 0;j < 3;j++) {
        sum += arr[i][j];
      }
      cout << names[i] << "的总分为" << sum << endl;
    }
    system("pause");
    return 0;
  }
  ```
  输出：
  ```bash
  张三的成绩为300
  李四的成绩为240
  王五的成绩为210
  张三的总分为300
  李四的总分为240
  王五的总分为210
  请按任意键继续...
  ```
  - 注意字符串数组的初始化方式，使用`string names[3][10] = {"张三","李四","王五"};`，其中`"张三"`、`"李四"`、`"王五"`为字符串常量，不能省略引号。
  - 通过`for`循环获取二维数组内的元素。这是以后经常用到的方法。
== 1.17.函数
  函数是一段代码，用于完成特定的任务。函数可以重复调用，提高代码的复用性。减少重复造轮子这一步骤。
=== 1.17.1.函数定义
  ```cpp
  #include<iostream>
  using namespace std;
  int add(int a, int b) {
    return a + b;
  }
  int main() {
    int x = 0;
    cin >> x;
    int y = 0;
    cin >> y;
    cout << "x+y=" << add(x, y) << endl;
  }
  ```
  输出：
  ```bash
  2 3
  x+y=5
  请按任意键继续...
  ```
  - 函数定义的格式：
    ```cpp
    数据类型 函数名(参数列表) {
      函数体
      return 返回值;
    }
    ```
=== 1.17.2.函数示例：交换变量值
  错误示例：
  ```cpp
  #include <iostream>
  using namespace std;
  // 不返回东西的函数为void无类型函数,洗一个交换数字的函数，无任何返回值。以下为错误案例：形参改变不影响实参
  int swap(int a, int b) {
  	int temp = a;
  	a = b;
  	b = temp;
  	return a,b;
  }
  int main() {
  	int x = 0; int y = 0;
  	cout << "请输入两个值" << endl;
  	cin >> x;cin >> y;
  	cout << "交换前x=" << x << "，y=" << y << endl;
  	swap(x, y);
  	cout << "交换后x=" << x << "，y=" << y << endl;
  }//最终输出并不会交换。
  ```
  函数调用不会改变函数参数的值。要明白传入函数的是形式参数，在函数内创建临时变量并销毁，计算机分配临时内存给形式参数。你返回的值并没有实际进入`x,y`。
  取巧方法：
  ```cpp
  void swap(int a, int b) {
    cout << a<<  " " << b << endl;
    int temp = a;
    a = b;
    b = temp;
    cout << a <<  " " << b << endl;
  }
  int main() {
    int x = 0;int y = 0;
    cin >> x;cin >> y;
    swap(x, y);
  }
  ```
  输出：
  ```bash
  2 3
  2 3
  3 2
  请按任意键继续...
  ```
  这是一种在函数内部输出的方法，但本质上还是没有变换内存地址指向的值。
  正确答案用到了指针和解引用：
  ```cpp
  void swap(int* a, int* b)
  {
    int temp = *a;
    *a = *b;
    *b = temp;
  }
  int main()
  {
    int x = 0;
    int y = 0;
    cin >> x;
    cin >> y;
    swap(&x, &y);
    cout << "交换后x=" << x << "，y=" << y << endl;
  }
  ```
  输出结果：
  ```bash
  2 3
  交换后x=3，y=2
  请按任意键继续...
  ```
  函数`swap()`的参数`a`和`b`是两个指针，指向两个变量。函数内部通过指针`*a`和`*b`交换两个变量的值。`&`为，取地址符号，用于获取创建变量的地址。而`*`为，解引用符号，用于获取地址所对应的值。`int* a`声明了一个指向`int`的指针变量`a`。
=== 1.17.3.函数形式
  - 无参数无返回值
  - 有参数无返回值
  - 无参数有返回值
  - 有参数有返回值
  ```cpp
  #include <iostream>
  #include <string>
  using namespace std;
  //有参有返，有参无返，无参有返，无参无返
  int test1(int a) {
    cout << "test1  a+1=" << a + 1 << endl;
    return a + 1;
  }
  void test2(int a) {
    cout << "test2  a是一个数字" <<endl;
  }
  string test3() {
    return "test3  我是你";
  }
  void test4() {
    cout<<"test4  abcdefghijklmn" << endl;
  }
  int main() {
    int num = test1(100);
    string str = test3();
    test1(num);
    test2(num);
    cout<<test3()<<endl;
    test4();
    system("pause");
    return 0;
  }
  ```
  输出：
  ```bash
  test1  a+1=101
  test1  a+1=102
  test2  a是一个数字
  test3  我是你
  test4  abcdefghijklmn
  请按任意键继续...
  ```
=== 1.17.4.函数分体
  一般大型项目不可能一个`cpp`就全部写完，一般都要通过函数和执行体两个步骤进行分体式开发。这也是为了保护版权所需的。`.cpp`结尾的称为源文件，`.h`结尾的为头文件。源文件中包含函数的定义，头文件中包含函数的声明。最后在`main.cpp`文件中包含头文件，并调用函数。
  ```cpp
  <main.cpp>
  #include <iostream>
  #include"dic.h"
  using namespace std;
  //1.创建头文件.h
  //2.创建源文件.cpp,要引用头文件
  //3.头文件写声明，源文件写定义
  int main() {
    for (int i = 0;i < 10000;i++) {
      dic();
    };
  }
  ```
  ```cpp
  <dic.h>
  #include <iostream>
  using namespace std;
  void dic();
  ```
  ```cpp
  <dic.cpp>
  #include <iostream>
  using namespace std;
  void dic() {
    cout << "666666666" << endl;
  }
  ```
  运行编译`main.cpp`，输出：
  ```bash
  666666666
  666666666
  666666666
  666666666
  666666666
  666666666
  666666666
  666666666
  666666666
  666666666
  请按任意键继续...
  ```
  - `.h`头文件的作用是在于声明包含在其它源文件中的函数。
  - `.cpp`源文件的作用是在于定义函数的具体实现。`main.cpp`和`.cpp`
=== 1.17.5.函数声明
  函数声明是告诉编译器，函数存在，但函数的具体实现可能在`main`后，如下：
  ```cpp
  #include<iostream>
  using namespace std;
  int max(int a, int b);//没有这一句会报错，因为函数在后面，没办法引用，提前声明计算才才能找到
  int main() {
    int x = 9;int y = 956;
    cout << " 最大值为：" << max(x, y) << endl;
    system("pause");
    return 0;
  }
  int max(int a, int b) {
    return a > b ? a : b;
  }
  ```
  输出：
  ```bash
  最大值为：956
  请按任意键继续...
  ```
  可以看到此处函数具体实现放在了程序入口的后面，为了避免编译器找不到函数，我们对齐进行声明。声明的格式为`返回值类型 函数名(参数类型 参数名,参数类型 参数名,...)`。如本例中的`int max(int a, int b)`。
= 2.`C++`入门
  本章开始，课程将着重讲述`C++`的指针、结构体，并通过一个实例系统来运用上述的东西。
== 2.1.指针
=== 2.1.1.指针定义
  指针，用于指向内存。方便高级程序员更灵活进行编程。指针变量则是专门用于指向内存地址的一种变量。很多时候我们编程都只是浮于表面，不涉及太多硬件的操作，而指针使得编程灵活性大大增加。在交换那一章节已经初步看到指针的威力。

  下面我们看看怎么使用指针：
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
    //1.定义指针
    int a = 10;
    int* p = &a;//&为取址符，数据类型* 指针变量名=&变量名
    cout << p << endl;
    //2.使用指针
    cout << *p << endl;//*p为该地址指向的数，*为解引用符，方法是*指针变量名，得到的结果是这个内存中的数据
    *p = 1000000000;//对指针指向的地址进行修改，我觉得很OK。
    cout << a << endl;
    system("pause");
    return 0;
  }
  ```
  输出结果：
  ```bash
  000000C4E698FCE4
  10
  1000000000
  ```
  - 指针的使用方法：
    - 定义指针：`数据类型* 指针变量名=&变量名`
    - 使用指针：`*指针变量名`
    - 指针变量名：`指针变量名`
    - 指针指向的地址：`&变量名`
    - 指针指向的地址指向的数：`*指针变量名`
=== 2.1.2.指针的大小
  指针的大小是固定的，在`32位`系统下是`4字节`，在`64位`系统下是`8字节`。
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    int a = 10;
    int* p = &a;
    cout << sizeof(int*) << "  " << sizeof(p) << endl;//64位系统指针类型大小为8
    system("pause");
    return 0;
  }
  ```
  输出结果：
  ```bash
  8  8
  ```
=== 2.1.3.空指针与野指针
  - 空指针：指针变量指向`内存中编号为0`的空间。
  - 野指针：指针变量指向`非法的内存空间`。
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    //空指针：初始化时先指向null，是系统内的空间，一般不可访问。
    int *p = NULL;
    *p = 10000;//运行会报错，因为0-255为系统内存空间，不可更改。
    //野指针：没权限或不适宜修改的空间（非法空间）。
    //程序中尽量不要出现野指针。否则申请权限不到位，很容易报错。
    int* q = (int*)0x1100;
    cout << *q << endl;//会报错，因为这块内存空间没有申请。我们没有查询及修改的权限。很离谱捏。
  }
  ```
=== 2.1.4.常量指针与指针常量
  - 常量指针：`const int* p = &a;`，指针指向可以改，指针指向的值不能改。
  - 指针常量：`int* const p = &a;`，指针指向不可以改，但是指向的值可以改。
  - 常量指针常量：`const int* const p = &a;`，指针指向和指向的值都不能改。
  + 小技巧：`const`和`*`谁先出现，就是中文顺序下谁先出现。
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    //const修饰指针，称为常量指针，指针指向可以改，指针指向的值不能改。
    int a = 10;int b = 20;const int* p = &a;
    *p = 20;//报错，因为不能修改值
    p = &b;//不报错。可以更改指向。
    //const修饰常量，此时指针指向不可以改，但是指向的值可以改
    int *const q = &b;
    *q = 20;//不报错，可以改值
    q = &a;//报错，不能更改指向。
    const int* const r = &a;//指向和指向值都不能改
    system("pause");
    return 0;
  }
  ```
=== 2.1.5.指针数组
  ```cpp
  #include<iostream>
  using namespace std;
  int main() {
    int arr[10] = { 1,2,3,4,56655,6,7,8,9,10 };
    int* p = arr;//指向首地址，直接相当于指到第一个。
      cout << *p << endl;
      cout << *(p + 1) << endl;
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); i++) {
      cout << *(p + i) << endl;
      //也可以cout<<*p<<endl;p++;
    };
    system("pause");
    return 0;
  }
  ```
  - 数组名传参是指针。指向首元素地址。
  - `p++`可以使得指针向下一位移动，每+一次移动4个字节。
  - 可以通过遍历指针的形式去输出整个数组。
=== 2.1.6.函数指针
  之前交换的那个例子。被称作地址传递。
  ```cpp
  #include<iostream>
  using namespace std;
  void swap(int *p1, int *p2)
  {
    int temp = *p1;
    *p1 = *p2; 
    *p2 = temp;
  }
  int main() {
    int a = 10;int b = 20;
    swap(&a, &b);
    cout << a << "   " << b << endl;//地址可以传递实参。
    system("pause");
    return 0;
  }
  ```
  - 函数参数传递分为值传递和地址传递。
  - 想只改变形参而不改变实参，用值传递。参考交换函数那一章的错误范例。
  - 改变实参则需要使用地址传递，因此需要指针。
=== 2.1.6.指针函数数组综合
  - 请通过值传递函数和地址传递函数分别实现冒泡排序法。
  - 值传递法：
    ```cpp
     //值传递方法
    #include <iostream>
    using namespace std;
    void BubbleArr(int* arr, int len) {
      for (int i = 0;i < len;i++) {
        for (int j = 0;j < len - i - 1;j++) {
          if (arr[j] > arr[j+1]) {
            int temp = arr[j+1];arr[j+1] = arr[j];arr[j] = temp;
          }
        }
      }
    }
    int main() {
      int arr[] = { 2,31,3,43245432,5,345,1,4,23,4,3,5,4,32,5,43,5,234,5,32,45,234 };
      int len = sizeof(arr) / sizeof(arr[0]);
      BubbleArr(arr, len);
      for (int k = 0;k < len;k++) {
        cout << arr[k] << endl;
      };
      system("pause");
      return 0;
    }
    ```
    输出结果：
    ```bash
    1
    2
    3
    3
    4
    4
    4
    5
    5
    5
    5
    5
    23
    31
    32
    32
    43
    45
    234
    234
    345
    43245432
    ```
    地址传递法：
    ```cpp
    #include<iostream>
    using namespace std;

    void BubbleArr(int * arr, int len) {
      for (int i = 0;i < len - 1;i++) {
        for (int j = 0;j < len - i - 1;j++) {
          if (*(arr + j) > *(arr + j + 1)) {
            int temp = *(arr+j+1);
            *(arr + j + 1) = *(arr + j);
            *(arr + j) = temp;
          }
        }
      }
    }
    int main() {
      int arr[] = { 2,31,3,43245432,5,345,1,4,23,4,3,5,4,32,5,43,5,234,5,32,45,234 };
      int len = sizeof(arr) / sizeof(arr[0]);
      int* p = arr;
      BubbleArr(p, len);
      for (int k = 0;k < len;k++) {
        cout << arr[k] << endl;
      };
      system("pause");
      return 0;
    }
    ```
    输出结果：
    ```bash
    1
    2
    3
    3
    4
    4
    4
    5
    5
    5
    5
    5
    23
    31
    32
    32
    43
    45
    234
    234
    345
    43245432
    ```
  - 为何此处值传递依然可以修改数组的排序？因为数组传参本质上传的就是首元素地址。传入的`arr`本质上是指针。因此本质上并不分值传递和地址传递，只是写法不同。
== 2.2.结构体
=== 2.2.1.结构体定义
  结构体，本质上是允许用户自定义一个数据类型为自己所用。是面向对象编程的基石。
  - 语法：
    ```cpp
    struct 结构体名{类型1 成员变量1;类型2 成员变量2;...};
    ```
    示例：
    ```cpp
    #include<iostream>
    #include<string>
    using namespace std;
    //可以理解为用户创造的一种数据类型。
    //语法：struct 结构体名 {
    //	数据类型 成员列表;
    //}（可选：变量名）;
    struct student {
      string name;
      int age;
      double score;
    }s3;
    int main() {
      //1.创建变量名，再通过.访问变量属性。
      struct student s1;
      s1.name = "bilibili";
      s1.age = 5;
      s1.score = 5.0;
      cout << "姓名:" << s1.name << "年龄:" << s1.age << "分数:" << s1.score << endl;
      //2.直接上
      struct student s2 = { "张三",19,100.0 };
      cout << "姓名:" << s2.name << "年龄:" << s2.age << "分数:" << s2.score << endl;
      //3.在定义的时候可以直接写。
      s3.name = "bilibili";s3.age = 5;s3.score = 5.0;
      cout << "姓名:" << s3.name << "年龄:" << s3.age << "分数:" << s3.score << endl;
    }//其实struct关键字可以省略。
    ```
    - 定义结构体的时候关键字`struct`不可以省略，定义的语法如例子所示。
    - 实例化一个结构体变量的时候，可以省略结构体的关键字，但是必须使用结构体的名称。有三种实例化方式：
      + 结构体名 变量名;变量名.成员1 = 值1,变量名.成员2 = 值2,...
      + 结构体名 变量名 = {值1,值2,值3...};
      + 定义结构体的末端位置分号前直接添加变量名。后续可以不用声明直接使用：变量名.成员1 = 值1,变量名.成员2 = 值2,...
=== 2.2.2.结构体数组
  ```cpp
  //本质上int arr[]变成struct 名字 arr[]
  int main() {
    //结构体数组，和结构体差不多
    struct student arr[3] = {
      {"张三",18,100},
      {"李四",28,327},
      {"王五",65,888}
    };//直接创建好结构体数组
    //可以通过调用索引.成员变量来改变成员值。
    arr[2].name = "牛逼哥";
    for (int i = 0;i < sizeof(arr) / sizeof(arr[0]);i++) {
      cout << arr[i].name << "  " << arr[i].age << "  " << arr[i].score << endl;
    }
    system("pause");
    return 0;
  }
  ```
  输出结果：
  ```bash
  张三  18  100
  李四  28  327
  牛逼哥  65  888
  ```
  - 不要想太复杂，本质上是`int arr[]`改成`struct Student arr[]`，只是数据类型改了，本质上并没有变。结构体变量调用成员变量和数组索引的特性依然没变。
  - 可以通过数组索引+结构体成员名的方式访问不同结构体变量的不同成员变量。
=== 2.2.3.结构体指针
  我们知道要访问结构体中的属性可以通过`变量名.属性名`的方式访问，那么结构体指针呢？可以通过`p->属性名`的方式访问。
  ```cpp
  #include<iostream>
  #include<string>
  using namespace std;
  struct student {
    string name;
    int age;
    double score;
  };
  int main() {
    student s = { "牛逼哥",30,70 };
    student* p = &s;//指针类型为结构体，不能再用int
    cout << p->name << p->age << p->score << endl;//用->取结构体中的内容。
    system("pause");
    return 0;
  }
  ```
  输出结果：
  ```bash
  牛逼哥3070
  ```
=== 2.2.4.结构体嵌套
  嵌套结构体，结构体中可以嵌套结构体。比如创立一个结构体老师，老师包含一个结构体学生。
  ```cpp
  #include<iostream>
  #include<string>
  using namespace std;
  struct student {
    string name;
    int age;
    double score;
  };
  struct teacher {
    string name;
    int age;
    struct student std;
  };
  int main() {
    teacher t = { "卢老师",50,{"官院士",6,100} };
    //随后输出即可。
    struct teacher * p = &t;
    cout << p->name << " " << p->age << " " << p->std.name << " " << p->std.age << " " << p->std.score << endl;
  }
  ```
  输出结果：
  ```bash
  卢老师 50 官院士 6 100
  ```
=== 2.2.5.结构体函数传参
  还是值传参和地址传参。
  ```cpp
  #include<iostream>
  #include<string>
  using namespace std;
  struct student {
    string name;
    int age;
    double score;
  };
  void PrintStudent(string a, int b, double c) {
    b = 200;//此处实际结构体中的年龄不变
    cout << "姓名：" << a << "  " << "年龄：" << b << "  " << "分数：" << c << endl;
    return;
  }
  void Print(struct student s1) {

    cout << "姓名：" << s1.name << "  " << "年龄：" << s1.age <<
      "  " << "分数：" << s1.score << endl;
  }
  void Got(struct student* p) {
    p->age = 200;//改变了结构体中的age
    cout << "姓名：" << p->name << "  " << "年龄：" << p->age <<
      "  " << "分数：" << p->score << endl;
  }
  int main() {
    student s1 = { "杀软",-55,0 };
    PrintStudent(s1.name, s1.age, s1.score);
    cout << "姓名：" << s1.name << "  " << "年龄：" << s1.age <<
      "  " << "分数：" << s1.score << endl;
    Print(s1);
      cout << "姓名：" << s1.name << "  " << "年龄：" << s1.age <<
      "  " << "分数：" << s1.score << endl;
    Got(&s1);
      cout << "姓名：" << s1.name << "  " << "年龄：" << s1.age <<
      "  " << "分数：" << s1.score << endl;
  }
  ```
  输出结果：
  ```bash
  姓名：杀软  年龄：200  分数：0
  姓名：杀软  年龄：-55  分数：0
  姓名：杀软  年龄：-55  分数：0
  姓名：杀软  年龄：200  分数：0
  姓名：杀软  年龄：200  分数：0
  姓名：杀软  年龄：200  分数：0
  ```
  可以看到，值传参和地址传参的区别在于，值传参不会改变结构体中的值，而地址传参会改变结构体中的值。
=== 2.2.6.结构体常量指针
  我们知道函数传参的时候有值传递和地址传递。那么他们具体的区别在于：
  - 值传递是通过拷贝原有参数并对拷贝体进行操作的。因此其效率高，但是在大结构体甚至结构体数组中极为耗费内存。
  - 地址传递是通过指针进行操作的。因此其效率相较于值传递低，但是可以处理大型结构体。防止内存溢出的风险。（指针X86、X64分别占大小4字节、8字节，只移动指针不会改变耗费内存）
  而我们使用指针传参很容易误操作导致源数据变更，因此我们需要通过设立常量指针防止在函数体中误修改值。
  ```cpp
  #include<iostream>
  using namespace std;
  struct student {
    string name;
    int age;
    double score;
  };
  void Got(const student* p) {
    p->age = 1919;//报错。
    cout << "姓名：" << p->name << "  " << "年龄：" << p->age <<
      "  " << "分数：" << p->score << endl;
  }
  int main() {
    student s1 = { "杀软",-55,0 };
    Got(&s1);
    system("pause");
    return 0;
  }
  ```
  输出结果：
  ```bash
  errorE0137:表达式必须是可修改的左值
  errorC3490:由于正在通过常量对象访问“age”，因此无法对其进行修改。
  ```		
  把`p->age = 1919;//报错。`注释掉即可。
  输出结果：
  ```bash
  姓名：杀软  年龄：-55  分数：0
  ```
=== 2.2.7.案例1
  毕设每个老师带着5个学生，请将其描述出来
  ```cpp
  #include<iostream>
  #include<string>
  #include<ctime>
  using namespace std;
  struct student {
    string name;
    int age;
    int score;
  };
  struct teacher {
    string name;
    struct student sarr[5];
  };
  void start(teacher tarr[],int len) {
    string nameseed = "abcdefghijklmnopqrstuvwxyz";
    for (int i = 0;i < len;i++) {
      tarr[i].name = "teacher_";
      tarr[i].name += nameseed[i];
      for (int j = 0;j < 5;j++) {
        tarr[i].sarr[j].name = "student_";
        tarr[i].sarr[j].name +=nameseed[i*5+j];
        int random = rand() % 101;//0-100随机数
        tarr[i].sarr[j].score = random;
      }
    };
  }
  int main() {
    srand((unsigned int)time(NULL));
    teacher tarr[3];
    int len = sizeof(tarr) / sizeof(tarr[0]);
    start(tarr, len);
    for (int i = 0;i < len;i++) {
      cout << " 老师姓名：" << tarr[i].name << endl;
      for (int j = 0;j < 5;j++) {
        cout << "\t学生姓名：" << tarr[i].sarr[j].name << " 学生分数："
          << tarr[i].sarr[j].score << endl;
      };
    };
    system("pause");
    return 0;
  }
  ```
  输出结果：
  ```bash
  老师姓名：teacher_a
          学生姓名：student_a 学生分数：62
          学生姓名：student_b 学生分数：72
          学生姓名：student_c 学生分数：13
          学生姓名：student_d 学生分数：9
          学生姓名：student_e 学生分数：0
  老师姓名：teacher_b
          学生姓名：student_f 学生分数：65
          学生姓名：student_g 学生分数：94
          学生姓名：student_h 学生分数：81
          学生姓名：student_i 学生分数：59
          学生姓名：student_j 学生分数：4
  老师姓名：teacher_c
          学生姓名：student_k 学生分数：91
          学生姓名：student_l 学生分数：86
          学生姓名：student_m 学生分数：86
          学生姓名：student_n 学生分数：73
          学生姓名：student_o 学生分数：39
  请按任意键继续...
  ```
  + 技巧1：设立字符串，通过循环实现变量批量顺序命名，这个技巧对于后续代码复用很重要。
  + 技巧2：结构体数组值传参法简洁明了，通过嵌套实现链表快速索引。
  + 技巧3：`srand((unsigned int)time(NULL));`实现随机数生成，控制考试分数。
=== 2.2.8.案例2
  创建一个结构体数组，里面包含数个同学的名字和考试分数，请按照升序排列。
  ```cpp
  #include<iostream>
  #include<string>
  using namespace std;
  struct Hero {
    string name;
    int age;
  };
  void POP(struct Hero Harray[], int len) {
    for (int i = 0;i < len;i++) {
      for (int j = 0;j < len - i - 1;j++) {
        if (Harray[j].age > Harray[j + 1].age) {
          struct Hero Temp = Harray[j + 1];
          Harray[j + 1] = Harray[j];
          Harray[j] =Temp;
        }
        else {
          continue;
        }
      }
    }
  }
  int main() {
    Hero Harray[5] = {
      {"A",24},
      {"B",44},
      {"C",7},
      {"D",99},
      {"E",74453}
    };
    int len = sizeof(Harray) / sizeof(Harray[0]);
    POP(Harray, len);
    for (int i = 0;i < len;i++) {
      cout << "姓名：" << Harray[i].name << "  年龄：" << Harray[i].age << endl;
    }
    system("pause");
    return 0;
  }
  ```
  输出结果：
  ```bash
  姓名：C  年龄：7
  姓名：A  年龄：24
  姓名：B  年龄：44
  姓名：D  年龄：99
  姓名：E  年龄：74453
  ```
  - 冒泡排序结合结构体数组的`int`元素。值得一学。将`int array`改为`struct Harray`。
= 3.通讯录管理系统实战
== 3.1.从基础入门乱写到项目实战，学会工作空间管理。
  这一节我们将通过一个`C++`项目实战，来提高工作空间管理能力。本章将不按照视频课的内容对应，代码为头文件源文件和`main`分离的方式，为开发大型项目进行基础知识和实践的衔接。
== 3.2.项目简介
  - 通讯录管理系统是一个简单的`C++`项目，用于管理联系人的信息。用户可以添加、删除、修改和查询联系人的信息等。
  - 项目分为头文件、源文件和`main`函数三部分。头文件包含函数声明和结构体定义，源文件包含函数实现，`main`函数包含程序入口。
  - 我们知道通讯录的不同的人信息结构一致，人数众多。因此我们选择使用结构体数组来设立人联系信息。
  - 而通讯录本身需要通讯人信息和一个“指针”——指的是添加到第几个联系人，这个变量将影响多个函数的实现，因此我们通讯录的结构体使用信息构成的结构体数组和一个参数`m_size`，不同的函数操作会导致这个参数动态变化。
== 3.3.代码简介
  - 头文件
    ```cpp
    <addPerson.h>
    #pragma once
    #define MAX 1000//最大人数
    #include<iostream>
    #include<string>
    using namespace std;
    struct Person {
        string m_Name;//姓名
        int m_Sex;//性别 1.男 2.女
        int m_Age;//年龄
        string m_Phone;//手机号码
        string m_Addr;//地址
    };
    struct AddressBook {
        Person personArray[MAX];//通讯录中保存联系人的数组
        int m_Size;//计数器
    };
    void addPerson(AddressBook* Abs);

    <delPerson.h>
    #pragma once
    #include "addPerson.h"
    void delPerson(AddressBook* Abs);
    int isExist(AddressBook* Abs);

    <findPerson.h>
    #pragma once
    #include "addPerson.h"
    #include "delPerson.h"
    void findPerson(AddressBook* Abs);

    <modifyPerson.h>
    #pragma once
    #include "addPerson.h"
    #include "delPerson.h"
    void modifyPerson(AddressBook* Abs);

    <showPerson.h>
    #pragma once
    #include "addPerson.h"
    void showPerson(AddressBook* Abs);
    ```
    在第一个功能`addPerson`中，我们定义了结构体。因此后续的头文件都引用它，以增加代码复用，减少重复逻辑。其余头文件各自声明需要用的函数。
  - 源文件
    + `addPerson.cpp`
      代码如下：
      ```cpp
      #define _CRT_SECURE_NO_WARNINGS
      #include <stdio.h>
      #include <iostream>
      #include <string>
      #include "addPerson.h"
      using namespace std;
      void printInfo(Person p)
      {
          cout << "姓名：" << p.m_Name << "  " << "\t性别：" << ((p.m_Sex == 1) ? "男" : "女") << "  " << "\t年龄：" << p.m_Age << "  " << "\t电话：" << p.m_Phone << "  " << "\t地址：" << p.m_Addr << endl;
      }
      //此时这个m_size至关重要。作为后续索引的“指针”
      void addPerson(AddressBook* Abs)
      { 
          if (Abs->m_Size == MAX)
          {
              cout << "联系人已满" << endl;
          }
          else
          { 
              cout << "请输入姓名：" << endl;
              cin>>Abs->personArray[Abs->m_Size].m_Name;
              while (1)
              {
                  cout << "请输入性别：1.男 2.女" << endl;
                  cin >> Abs->personArray[Abs->m_Size].m_Sex;
                  if (Abs->personArray[Abs->m_Size].m_Sex == 1 || Abs->personArray[Abs->m_Size].m_Sex == 2)
                  {
                      break;
                  }
                  else
                      cout << "输入错误，请重新输入" << endl;
              }
              cout << "请输入年龄：" << endl;
              cin >> Abs->personArray[Abs->m_Size].m_Age;
              while (1)
              {
                  cout << "请输入手机号：" << endl;
                  cin >> Abs->personArray[Abs->m_Size].m_Phone;
                  if (sizeof(Abs->personArray[Abs->m_Size].m_Phone) == 40)
                      break;
                  else
                      cout << "输入错误，请重新输入" << endl;
              }
              cout << "请输入住址：" << endl;
              cin  >> Abs->personArray[Abs->m_Size].m_Addr;
              system("cls");//清除上方冗余信息
              printInfo(Abs->personArray[Abs->m_Size]);
              cout << "已添加联系人" << endl;
              Abs->m_Size++; 
          }
      }
      ```
      - 此时结构体的`m_size`参数派上用场了。我们用它来索引最新的联系人。
      - 函数传参使用地址传参方式，传入通讯录结构体数组地址，通过指针访问嵌套下的结构体数组以及索引。
    + `delPerson.cpp`
      代码如下：
      ```cpp
      #define _CRT_SECURE_NO_WARNINGS
      #include "addPerson.h"
      #include "delPerson.h"
      int isExist(AddressBook* Abs)
      {
        if (Abs->m_Size == 0)
        {
          system("cls");
              cout << "没有联系人,请添加联系人后再进行该操作。" << endl;
          //system("cls");
              return -1;
        }
        else
        {
          string name;
          cout << "请输入要操作的联系人姓名：" << endl;
          cin >> name;
          for (int i = 0; i < Abs->m_Size; i++)
          {
            if (name == Abs->personArray[i].m_Name)
            {
              return i;
            }
            else
            {
              continue;
            }
            if (i == Abs->m_Size - 1)
            {
              cout << "没有此联系人,请重新输入" << endl;
              return -1;
            }
          }
        }
      }
      ```
      - 函数中调用`isExist`函数，判断联系人是否存在。
      - 该函数复用率高，因此在对应头文件中同样进行声明
    + `findPerson.cpp`
      代码如下：
      ```cpp
      #define _CRT_SECURE_NO_WARNINGS
      //#include "delPerson.h"
      #include "findPerson.h"
      void findPerson(AddressBook* Abs)
      {
        int index = isExist(Abs);
          if (index != -1)
          { 
              cout << "已找到该联系人" << endl;
              cout << "姓名：" << Abs->personArray[index].m_Name << "\t";
              cout << "性别：" << ((Abs->personArray[index].m_Sex == 1) ? "男" : "女") << "\t";
              cout << "年龄：" << Abs->personArray[index].m_Age << "\t";
              cout << "电话：" << Abs->personArray[index].m_Phone << "\t";
              cout << "地址：" << Abs->personArray[index].m_Addr << endl;
          }
      }
      ```
    + `modifyPerson.cpp`
      代码如下：
      ```cpp
      #define _CRT_SECURE_NO_WARNINGS
      #include "modifyPerson.h"
      void modifyPerson(AddressBook* Abs)
      { 
        int index=isExist(Abs);
        if(index!=-1)
        { 
              cout<<"变更信息前此人的信息："<<endl;
              cout << "姓名：" << Abs->personArray[index].m_Name << "\t";
              cout << "性别：" << ((Abs->personArray[index].m_Sex == 1) ? "男" : "女") << "\t";
              cout << "年龄：" << Abs->personArray[index].m_Age << "\t";
              cout << "电话：" << Abs->personArray[index].m_Phone << "\t";
              cout << "地址：" << Abs->personArray[index].m_Addr << endl;
              cout<<"请输入修改的姓名："<<endl;
              cin>>Abs->personArray[index].m_Name;
              cout<<"请输入修改的性别："<<endl;
              cin>>Abs->personArray[index].m_Sex;
              cout<<"请输入修改的电话："<<endl;
              cin>>Abs->personArray[index].m_Phone;
              cout<<"请输入修改的住址："<<endl;
              cin>>Abs->personArray[index].m_Addr;
              cout<<"信息变更成功！"<<endl;
              cout << "变更信息后此人的信息：" << endl;
              cout << "姓名：" << Abs->personArray[index].m_Name << "\t";
              cout << "性别：" << ((Abs->personArray[index].m_Sex == 1) ? "男" : "女") << "\t";
              cout << "年龄：" << Abs->personArray[index].m_Age << "\t";
              cout << "电话：" << Abs->personArray[index].m_Phone << "\t";
              cout << "地址：" << Abs->personArray[index].m_Addr << endl;
        }
      }
      ```
    + `showPerson.cpp`
      代码如下：
      ```cpp
      #define _CRT_SECURE_NO_WARNINGS
      #include "addPerson.h"
      #include "showPerson.h"
      void showPerson(AddressBook* Abs)
      {	
        if (Abs->m_Size == 0)
        {
          cout << "没有联系人！" << endl;
          system("pause");
        }
        else
        {
          for (int i = 0; i < Abs->m_Size; i++)
          {
            cout << "姓名：" << Abs->personArray[i].m_Name << "\t" << "性别：" << ((Abs->personArray[i].m_Sex == 1) ? "男" : "女") << "\t" << "年龄：" << Abs->personArray[i].m_Age << "\t" << "电话：" << Abs->personArray[i].m_Phone << "\t" << "地址：" << Abs->personArray[i].m_Addr << endl;
          }
          cout << "显示完毕！" << endl;
        }
          system("pause");
        system("cls");//清除上方冗余信息
      }
      ```
  - 主函数
    ```cpp
    #define _CRT_SECURE_NO_WARNINGS
    #include <iostream>
    #include <string>
    #include "addPerson.h"
    #include "showPerson.h"
    #include "delPerson.h"
    #include "findPerson.h"
    #include "modifyPerson.h"
    using namespace std;
    //通讯录管理系统：
    //通讯录是实现记录亲友信息的工具，本教程项目利用C++来实现一个通讯录管理系统。
    //1.添加联系人：向通讯录中添加新的联系人，包括姓名、性别、年龄、电话、地址等信息。最多记录1000人
    //2.显示联系人：显示所有联系人信息
    //3.删除联系人：删除指定姓名联系人
    //4.查找联系人：根据姓名查找联系人
    //5.修改联系人：修改指定姓名联系人的资料
    //6.清空联系人：清空所有联系人
    //7.退出通讯录：退出通讯录系统
    /////////////////////////////////////////
    //第一步：封装一个menu函数，实现菜单功能，根据不同输入的菜单选项，调用不同的功能函数
    /////////////////////////////////////////
    //第二步：封装add  函数，实现添加联系人功能。
    // 1.设计数据结构，main中实例化通讯录结构体，实例化联系人结构体。将常量和结构体在头文件中定义，方便调用。
    // 2.封装add，并测试
    /////////////////////////////////////////
    //第三步：封装show函数，实现显示联系人功能。
    // 1.封装show，并测试
    //////////
    //第四步：封装del函数，实现删除联系人功能。
    // 1.检测联系人是否存在，在则返回数组索引，不存在则返回-1
    // 2.删除联系人，并返回删除联系人的索引
    ```
    ```cpp
    /////////////
    //第五步：封装find函数，实现查找联系人功能。
    //第六步：封装modify函数，实现修改联系人功能。
    //第七步，直接使m_size置0，则所有联系人将被清空，体会一下其中的妙处。

    void menu() 
    {
      cout<<"**************************************"<<endl;
        cout<<"*****         1.添加联系人        *****"<<endl;
        cout<<"*****         2.显示联系人        *****"<<endl;
        cout<<"*****         3.删除联系人        *****"<<endl;
        cout<<"*****         4.查找联系人        *****"<<endl;
        cout<<"*****         5.修改联系人        *****"<<endl;
        cout<<"*****         6.清空联系人        *****"<<endl;
        cout<<"*****         0.退出通讯录        *****"<<endl;
        cout << "**************************************" << endl;
    }
    int choice()
    {
        int choice;
        cout << "请输入你的选择：" << endl;
        cin >> choice;
        return choice;
    }
    int main()
    {
        /////实例化通讯录结构体
        AddressBook abs;
        ////////初始化当前联系人个数
        abs.m_Size = 0;
        ///////////////////////
        while (1)
        {
            menu();
            int a = choice();
            switch (a)
            {
            case 1:
                /////////通讯录中加入人
                addPerson(&abs);//需要传入地址，否则无法改动
                //cout << "已添加联系人" << endl;//测试语句
                break;
            case 2:
                showPerson(&abs);
                //cout << "显示联系人" << endl;//测试语句
                break;
            case 5:
                modifyPerson(&abs);
                //cout << "修改联系人" << endl;
                break;
            case 3:
                delPerson(&abs);
                //cout << "删除联系人" << endl;
                break;
            case 4:
                findPerson(&abs);
                //cout << "查找联系人" << endl;
                break;
    ```
    ```cpp
            case 6:
                abs.m_Size = 0;
                cout << "已清空" << endl;
                break;
            case 0:
                cout << "已退出通讯录" << endl;
                return 0;
            default:
                cout << "输入错误，请重新输入" << endl;
                continue;
            }
        }
        //delete abs;
        system("pause");
        return 0;
    }
    ```
== 3.4.编写思路
  + 先封装`menu`，这是每个程序的测试入口。
  + 然后设计数据类型，确定最终的数据交互范式。
  + 开始按照要求逐步插入功能。注意一个功能对应一个头文件。头文件中声明可供外部调用的函数。而源文件中的具体函数实现后续会被编译为`dll`文件或`lib`文件。这是为了保护劳动成果所设立的。难以从编译后的链接库去获取原函数。
  
