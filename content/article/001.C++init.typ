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
