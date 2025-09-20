#import "/typ/templates/blog.typ": *
#import "@preview/cetz:0.4.2"
#let blog-tags = (
  math:"Math",
)
#show: main.with(
  title: "Math001.Linear Algebra and Matrix Analysis",
  desc: ["A Lecture Notes of Linear Algebra and Matrix Analysis"],
  date: "2025-09-20",
  tags: (
    blog-tags.math,
  ),
)
//定义示例块
#let Example(body) = if sys-is-html-target {
  html.elem("div", body, attrs: (class: "typst-box typst-example"))
} else {
  box(width: 100%, fill: rgb(223,238,214), stroke:rgb("#446c2c"), radius: 5pt, inset: 10pt, body)
}
//定义定义块
#let Definition(body) = if sys-is-html-target {
  html.elem("div", body, attrs: (class: "typst-box typst-definition"))
} else {
  box(width: 100%, fill: rgb("#f5d6d6"), stroke:rgb("#bd2f2f"), radius: 5pt, inset: 10pt, body)
}
//定义引理块
#let Lemma(body) = if sys-is-html-target {
  html.elem("div", body, attrs: (class: "typst-box typst-lemma"))
} else {
  box(width: 100%, fill: rgb("#d6e6f5"), stroke:rgb("#2e74b1"), radius: 5pt, inset: 10pt, body)
}
//定义解题块
#let Solution(body) = if sys-is-html-target {
  html.elem("div", body, attrs: (class: "typst-box typst-solution"))
} else {
  box(width: 100%, stroke:rgb("#000000"), radius: 5pt, inset: 10pt, body)
}
//定义定理块
#let Theorem(body) = if sys-is-html-target {
  html.elem("div", body, attrs: (class: "typst-box typst-theorem"))
} else {
  box(width: 100%, fill: rgb("#f5f1d6"), stroke:rgb("#b19a2e"), radius: 5pt, inset: 10pt, body)
}
//定义推论块
#let Proposition(body) = if sys-is-html-target {
  html.elem("div", body, attrs: (class: "typst-box typst-proposition"))
} else {
  box(width: 100%, fill: rgb("#e8dfec"), stroke:rgb("#835799"), radius: 5pt, inset: 10pt, body)
}
//定义证明块
#let Proof(body) = if sys-is-html-target {
  html.elem("div", body, attrs: (class: "typst-box typst-proof"))
} else {
  box(width: 100%, fill: rgb("F5F5F5"), stroke:rgb("000000"), radius: 5pt, inset: 10pt, body)
}

// = Raw Blocks

// This is an inline raw block `class T`.

// This is an inline raw block ```js class T```.

// This is a long inline raw block ```js class T {}; class T {}; class T {}; class T {}; class T {}; class T {}; class T {}; class T {}; class T {}; class T {};```.

// Js syntax highlight are handled by syntect:

// ```js
// class T {};
// ```

// Typst syntax hightlight are specially handled internally:

// ```typ
// #let f(x) = x;
// ```
// $2+1=3$
// + 今天吃什么
//   + 我已
//   + 我是
//     ```
//     include<iostream>
//     ```
//   + 233$(1/2)+(3/4) $

// // #box(width: 100%,fill: rgb(223,238,214),stroke:rgb(114,180,74),radius: 5pt,inset: 10pt)[
// //   1. 求 $f(x) = x^2 - 4x + 3$ 的最值。
// // ]
// // #box(width: 100%,radius: 5pt,inset: 10pt,fill:rgb(223,238,214),stroke:rgb(114,180,74))[
// //   解 ：
// //   通过配方得：
// //   $
// //     f(x) = (x-2)^2 - 1
// //   $

// //   当 $x = 2$ 时，函数取最小值 $-1$。
// // ]

// #Example[  
//   EX_1. 求 $f(x) = x^2 - 4x + 3$ 的最值。
//   ]

// #Solution[秒杀。]

// #Definition[Def_2. 全纯函数]
// == 设 $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
// #Example[  
//   EX_1. 求 $f(x) = x^2 - 4x + 3$ 的最值。
//   ]

// #Example[  
//   EX_1. 求 $f(x) = x^2 - 4x + 3$ 的最值。
//   ]

// == 设 $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
// = 我牛
// == 打一桶
// === 加法公理 by DAvinqi
// + 输了
// + 哎
//   + 输了

//     #Lemma[*Axiom.*
//       $1+2=3$
//       ]
//   + LaTeX so beautiful.
    
//     #Theorem[*The_2.Fundamental Theorem of Algebra.*
    
//     $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
// ]

//     #Proof[*Proof.*
    
//     s设 $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
//     ]

//     #Proposition[*Pro_1.Cauchy Integral Formula.*
    
//     $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
//     ]

//     #Solution[*Solution.*
//     证明：秒杀。ming is a good boy.
    
//     ]

// = 戴金分割
// == 很难证明
// #Theorem[*The_3.*

// $QQ$ is a subset of $RR$. And $RR$ has #emph[LUB] property, please prove that;]

// #Proof[*Proof.*
//   设 $M = sup QQ$，则 $M \in RR$。
//   由于 $RR$ 有 LUB 性质，故 $M$ 是 $RR$ 的上界。
//   由此可知，$M$ 是 $QQ$ 的上界。
// ]
// 
// 基础目录生成
// #outline(
//   title: "Contents",        // 目录标题
//   depth: 3,            // 显示层级
//   indent: 1em,         // 层级缩进
//   // numbered: true,      // 是否显示编号
// )

= *Lecture Notes of Matrix Analysis*
= Perface
  This is a lecture note of Matrix Analysis course during my master's degree in Tongji University. With a base of linear algebra, this course is mainly aimed at introducing the _Jordan Matrix_ which is relative to the "diagonalization" of a matrix without full rank. Besides, this course will remind us some important concepts of linear algebra, while it is mainly focused on the _matrix_ and _vector_.

  In *section 0*, we will introduce some basic concepts of linear algebra, such as vector, matrix, linear transformation, linear combination, linear independence, span, dimension, basis, *rank(秩)*, space, similar(相似) matrix, eigenvalue and eigenvector(特征值和特征向量), congruent(合同) matrix, orthogonal(正交) matrix, quadratic form(二次型), positive-definite(正定) matrix        etc.

#outline(
  title: "Contents",        // 目录标题
  depth: 3,            // 显示层级
  indent: 1em,         // 层级缩进
  // numbered: true,      // 是否显示编号
)

= *Section 0. Basic Concepts of Linear Algebra*
== 0.1.Determinant 行列式
  // - In the study of linear algebra, the determinant is typically the first concept introduced. However, its underlying meaning is seldom explained by instructors; instead, students are often trained mechanically to carry out determinant computations. In what follows, we present three distinct definitions of the determinant.

    我们线性代数一般接触的第一个概念就是行列式。但是从来没有老师告诉过我们行列式是什么。我们像被训练机器一样训练去计算行列式！为了展示其本质与方便理解，我们将通过三种方式定义行列式。
=== 0.1.1.First Definition of Determinant 行列式第一定义
  #Definition[*Definition 0.1.1.1* Determinant 行列式
  
  // The determinant of a matrix $A$ is a *geometry metric* that is defined by the following denotion:

  行列式 $D _ A$ 是一个关于矩阵$A$的几何度量标量，定义为以下符号：

  $ D _ ( n ) = mat( delim: "|", a _ ( 11 ), dots.h.c, a _ ( 1 n ) ; dots.v,, dots.v ; a _ ( 11 ), dots.h.c, a _ ( n n ) ) $

  // where $a _ ( i j )$ is the entry in the $i$th row and $j$th column of $A$.

  其中 $a _ ( i j )$ 是矩阵 $A$ 的第 $i$ 行第 $j$ 列的元素。

  ]

  // - Let's see a determinant of $RR^2$ matrix. $D _ ( 1 ) = mat( delim: "|", a _ ( 11 ), a _ ( 12 ) ; a _ ( 21 ), a _ ( 22 ) ) $. It's not hard to figure out that the determinant of a $2 × 2$ matrix is the product of the two entries on the main diagonal:
     
    为什么说是几何度量？我们看到以下2×2矩阵的行列式，不难计算出其行列式的值:

    $ D _ ( 2 ) = mat( delim: "|", a _ ( 11 ), a _ ( 12 ) ; a _ ( 21 ), a _ ( 22 ) ) = a _ ( 11 ) a _ ( 22 ) - a _ ( 12 ) a _ ( 21) $

    // We can see the following situation:
    
    我们不妨现在看这个情况：

    // #show math.equation: block.with(fill: white, inset: 1pt)
    #cetz.canvas(length: 3cm, {
      import cetz.draw: *
      set-style(
        mark: (fill: black, scale: 2),
        stroke: (thickness: 0.4pt, cap: "round"),
        angle: (
          radius: 0.3,
          label-radius: .22,
          fill: green.lighten(80%),
          stroke: (paint: green.darken(50%))
        ),
        content: (padding: 1pt)
      )
      //坐标网格
      grid((-2, -2), (1.99, 1.99), step: 0.5, stroke: gray + 0.5pt)
      //画圆
      // circle((0,0), radius: 1)
      //画线：mark参数表示起点终点标记,stealth表示箭头。stroke: (dash: "dashed")表示虚线
      line((-2, 0), (2, 0), mark: (end: "stealth"))
      content((), $ x $, anchor: "west")
      line((0, -2), (0, 2), mark: (end: "stealth"))
      content((), $ y $, anchor: "south")

      for (x, ct) in ( (-2, $ -2 $), (-1.5, $ -3/2 $), (-1, $ -1 $), (-0.5, $ -1/2 $), (0.5, $ 1/2 $),(1, $ 1 $), (1.5, $ 3/2 $)) {
        line((x, 3pt), (x, -3pt))
        content((), anchor: "north", ct)
      }

      for (y, ct) in ((-2, $ -2 $), (-1.5, $ -3/2 $), (-1, $ -1 $), (-0.5, $ -1/2 $), (0.5, $ 1/2 $),(1, $ 1 $), (1.5, $ 3/2 $)) {
        line((3pt, y), (-3pt, y))
        content((), anchor: "east", ct)
      }

      // Draw the green angle
      // cetz.angle.angle((0,0), (1,0.5), (1, calc.tan(30deg)),
      //   label: text(green, [#sym.alpha]))
      // 画角
      cetz.angle.angle((0,0), (0,0), (1,0.5),
      label: text(red, [#sym.alpha]),fill: red.lighten(90%),radius:0.4,stroke: (paint: red.darken(50%)), label-radius: 0.35)

      cetz.angle.angle((0,0), (0,0), (0.5,1),
      radius:0.2,label: text(green, [#sym.beta]),label-radius: 0.25)

      //给线取名“alpha”，下方content调用
      line((0,0), (1,0.5),mark: (end: "stealth"),name: "alpha")
      content(("alpha.start", 50%, "alpha.end"), text(blue)[$ arrow("OA")$], anchor: "north")

      line((0,0), (0.5,1),mark: (end: "stealth"),name: "beta")
      content(("beta.start", 50%, "beta.end"), text(blue)[$ arrow("OB") $], anchor: "north")

      anchor("O",(0,0))
      content("O", [$O$], anchor: "north-east", padding: .1)
      anchor("A",(1,0.5))
      content("A", [$A(a_11,a_21)$], anchor: "north", padding: .1)
      anchor("B",(0.5,1))
      content("B", [$B(a_12,a_22)$], anchor: "west", padding: .1)
      anchor("C",(1.5,1.5))
      content("C", [$C$], anchor: "south-west", padding: .1)
      // line("A", "C", stroke: (paint: red))
      line("A", "C", stroke: (dash: "dashed"))
      line("A", (1,0), stroke: (dash: "dashed"))
      line("A", (0,0.5), stroke: (dash: "dashed"))
      line("C", "B", stroke: (dash: "dashed"))
      line("B", (0.5,0), stroke: (dash: "dashed"))
      line("B", (0,1), stroke: (dash: "dashed"))
      set-style(stroke: (thickness: 1.2pt))

      // line((30deg, 1), ((), "|-", (0,0)), stroke: (paint: red), name: "sin")
      // content(("sin.start", 50%, "sin.end"), text(red)[$ sin alpha $])
      // line("sin.end", (0,0), stroke: (paint: blue), name: "cos")
      // content(("cos.start", 50%, "cos.end"), text(blue)[$ cos alpha $], anchor: "north")
      // line((1, 0), (1, calc.tan(30deg)), name: "tan", stroke: (paint: orange))
      // content("tan.end", $ text(#orange, tan alpha) = text(#red, sin alpha) / text(#blue, cos alpha) $, anchor: "west")
    })

    给定矩阵$A=mat( delim: "[", a _ ( 11 ), a _ ( 12 ) ; a _ ( 21 ), a _ ( 22 ) )$. 我们关注到给定向量$arrow("OA")$和$arrow("OB")$情况下由这两个向量确定的平行四边形$▱ "OABC"$的面积：

    $ S _ ( ▱ O A B C ) & = l bullet m bullet sin ( beta - alpha ) \ & = l bullet m ( sin beta cos alpha - cos beta sin alpha ) \ & = l cos alpha bullet m sin beta - l sin alpha bullet m cos beta \ & = a _ ( 11 ) a _ ( 22 ) - a _ ( 2 ) a _ ( 21 ) $

    于是我们有：
    $ mat( delim: "|", a _ ( 11 ), a _ ( 12 ) ; a _ ( 21 ), a _ ( 22 ) ) = a _ ( 11 ) a _ ( 22 ) - a _ ( 12 ) a _ ( 21 ) = S _ ( ▱  O A B C ) $

    惊讶地发现，矩阵$A$的行列式就是其列向量$arrow("OA")$和$arrow("OB")$所确定的平行四边形的面积。

  - 在三维之中也是一样的：
    #cetz.canvas(length: 2cm, {
      import cetz.draw: *
      let phi = (1 + calc.sqrt(5)) / 2
      // grid((-2, -2, -2), (1.99, 1.99, 1.99), step: 0.5, stroke: gray + 0.5pt)

      ortho({
        // hide({
        //   line(
        //     (-phi, -1, 0), (-phi, 1, 0), (phi, 1, 0), (phi, -1, 0), close: true, name: "xy",
        //   )
        //   line(
        //     (-1, 0, -phi), (1, 0, -phi), (1, 0, phi), (-1, 0, phi), close: true, name: "xz",
        //   )
        //   line(
        //     (0, -phi, -1), (0, -phi, 1), (0, phi, 1), (0, phi, -1), close: true, name: "yz",
        //   )
        // })

        // intersections("a", "yz", "xy")
        // intersections("b", "xz", "yz")
        // intersections("c", "xy", "xz")
        
        // set-style(stroke: (thickness: 0.5pt, cap: "round", join: "round"))
        // line((0, 0, 0), "c.1", (phi, 1, 0), (phi, -1, 0), "c.3")
        // line("c.0", (-phi, 1, 0), "a.2")
        // line((0, 0, 0), "b.1", (1, 0, phi), (-1, 0, phi), "b.3")
        // line("b.0", (1, 0, -phi), "c.2")
        // line((0, 0, 0), "a.1", (0, phi, 1), (0, phi, -1), "a.3")
        // line("a.0", (0, -phi, 1), "b.2")
        line((-2, 0, 0), (2 ,0 ,0),mark: (end: "stealth"))
        content((), $ x $, anchor: "west")
        line((0, -2, 0), (0, 2, 0),mark: (end: "stealth"))
        content((), $ y $, anchor: "north")
        line((0, 0, -2), (0, 0, 2),mark: (end: "stealth"))
        content((), $ z $, anchor: "east")

        line((0, 0, 0), (1 ,0 ,0),mark: (end: "stealth"),stroke: (paint: red),name:"a1")
        content(("a1.start", 50%, "a1.end"), text(purple)[$ arrow(alpha) $], anchor: "north")
        line((0, 0, 0), (0 ,1 ,0),mark: (end: "stealth"),stroke: (paint: green),name:"a2")
        content(("a2.start", 50%, "a2.end"), text(purple)[$ arrow(beta) $], anchor: "east")
        line((0, 0, 0), (0 ,0 ,-1),mark: (end: "stealth"),stroke: (paint: blue),name:"a3")
        content(("a3.start", 50%, "a3.end"), text(purple)[$ arrow(gamma) $], anchor: "north")
        line((0, 1, 0), (1 ,1 ,0),stroke: (dash:"dashed"))
        line((1, 0, 0), (1 ,1 ,0),stroke: (dash:"dashed"))
        line((0, 1, 0), (0 ,1 ,-1),stroke: (dash:"dashed"))
        line((1, 0, 0), (1 ,0 ,-1),stroke: (dash:"dashed"))
        line((1, 1, 0), (1 ,1 ,-1),stroke: (dash:"dashed"))
        line((0, 1, -1), (1 ,1 ,-1),stroke: (dash:"dashed"))
        line((1, 0, -1), (1 ,1 ,-1),stroke: (dash:"dashed"))
        line((1, 0, -1), (0 ,0 ,-1),stroke: (dash:"dashed"))
        line((0 ,0 ,-1), (0 ,1 ,-1),stroke: (dash:"dashed"))
        // anchor("A", (0, phi, 1))
        // content("A", [$A$], anchor: "north", padding: .1)
        // anchor("B", (-1, 0, phi))
        // content("B", [$B$], anchor: "south", padding: .1)
        // anchor("C", (1, 0, phi))
        // content("C", [$C$], anchor: "south", padding: .1)
        // line("A", "B", stroke: (dash: "dashed"))
        // line("A", "C", stroke: (dash: "dashed"))
      })
    })

    由三个三维列向量$alpha = [ a _ ( 1 ), a _ ( 2 ), a _ ( 3 ) ], beta = [ b _ ( 1 ), b _ ( 2 ), b _ ( 3 ) ], gamma = [ c _ ( 1 ), c _ ( 2 ), c _ ( 3 ) ]$组成的矩阵$A$的行列式$det(A)$的计算公式为：
    $ mat( delim: "|", a _ ( 1 ), a _ ( 2 ), a _ ( 3 ) ; b _ ( 1 ), b _ ( 2 ), b _ ( 3 ) ; c _ ( 1 ), c _ ( 2 ), c _ ( 3 ) )^T = a _ ( 1 ) b _ ( 2 ) c _ ( 3 ) + a _ (2 ) b _ ( 3 ) c _ ( 1 ) + a _ ( 3 ) b _ ( 1 ) c _ ( 2 ) - a _ ( 1 ) b _ ( 3 ) c _ ( 2 ) - a _ ( 2 ) b _ ( 1 ) c _ ( 3 ) - a _ ( 3 ) b _ ( 2 ) c _ ( 1 ) $
    计算出的结果为三个三维向量组成的六面体体积。
  
  - 综上为行列式第一种定义：

  #Proposition[*Pro 0.1.1.1* Geometry meaning of determinant 行列式几何定义（第一定义）
  
  行列式的第一种定义最为直观，表示的是一个$RR^n$矩阵所含列向量张成的$n$维几何体的几何度量。如二维表示面积，三维表示体积。
  ]
=== 0.1.2.Basic Rules of Determinants 矩阵行列式基本规则
  #Theorem[*Theorem 0.1.2.1* Basic Rules of Determinants 矩阵行列式基本规则

  - 转置后行列式不变：
    $det(A) = det(A^T)$
  - 某行或某列元素全为0，行列式为0
  - 某行或某列有公因子$k$，可以提到外面。(倍乘性质)

    $mat( delim: "|", a _ ( 11 ), a _ ( 12 ), dots.h.c, a _ ( 1 n ) ; dots.v, dots.v, , dots.v ; k a _ ( i 1 ), k a _ ( i 2 ), dots.h.c, k a _ ( i n ) ; dots.v, dots.v, , dots.v ;  a _ ( n 1 ), a _ (  n 2 ), dots.h.c, a _ ( n n ) ) = k mat( delim: "|", a _ ( 1 1 ), a _ ( 1 2 ), dots.h.c, a _ ( 1 n ) ; dots.v, dots.v, , dots.v ; a _ ( i 1 ), a _ ( i 2 ), dots.h.c, a _ ( i n ) ; dots.v, dots.v, , dots.v ;  a _ ( n 1 ), a _ ( n 2 ), dots.h.c, a _ ( n n  ) )$
  - 行列式某行或某列可以拆成两数之和，则可以拆成两行列式之和

     $mat( delim: "|", a _ ( 11 ), a _ ( 12 ), dots.h.c, a _ ( 1 n ) ; dots.v, dots.v, , dots.v ; a _ ( i 1 )+b _ ( i 1 ), a _ ( i 2 )+b _ ( i 2 ), dots.h.c, a _ ( i n )+b _ ( i n ) ; dots.v, dots.v, , dots.v ;  a _ ( n 1 ), a _ ( n 2 ), dots.h.c, a _ ( n n  )  ) = mat( delim: "|", a _ ( 11 ), a _ ( 12 ), dots.h.c, a _ ( 1 n ) ; dots.v, dots.v, , dots.v ; a _ ( i 1 ), a _ ( i 2 ), dots.h.c, a _ ( i n ) ; dots.v, dots.v, , dots.v ;  a _ ( n 1 ), a _ ( n 2 ), dots.h.c, a _ ( n n  ) )+mat( delim: "|", a _ ( 11 ), a _ ( 12 ), dots.h.c, a _ ( 1 n ) ; dots.v, dots.v, , dots.v ; b _ ( i 1 ), b _ ( i 2 ), dots.h.c, b _ ( i n ) ; dots.v, dots.v, , dots.v ;   a _ ( n 1 ), a _ ( n 2 ), dots.h.c, a _ ( n n  ) )$
  - 两行互换，行列式变号（互换性质）
  - 某一行列与另一行列成比例或相等，行列式为0。
  - 某一行列$k$倍加到另一行，行列式不变。（倍加性质）
  ]

  注意以上性质均可通过第一种定义推导出来。需要掌握并理解第一定义。
=== 0.1.3.Second Definition of Determinant 行列式第二定义
  行列式第二定义是通过逆序数与全排列来定义的。

  #Definition[
    *Definition 0.1.3.1* Permutation 排列
    
    由$n$个数$1,2,dots.h.c,n$组成的一个有序数组称为$n$阶排列。如$1,3,2,4$是一个$4$阶排列。$n$阶排列有$n!$种情况。



  ]
  #Definition[
    *Definition 0.1.3.2* Inverse Permutation 逆序
    
    由$n$个数$1,2,dots.h.c,i_s,dots.h.c,i_t,dots.h.c,n$组成的一个排列，若$i_t < i_s$且$i_s$在$i_t$前面，则称这两个数构成一个逆序。如$1,3,2,4$中，$1$比后面的都小，不构成逆序；$3$比后面的$4$小但比后面的$2$大，构成1个逆序；$2$比后面的都小，不构成逆序；$4$后面没有了，不构成逆序。


  ]
  #Definition[
    *Definition 0.1.3.3* Inverse Permutation Number 逆序数
    
    一个排列的逆序数定义为：一个排列中逆序对的个数。如$1,3,2,4$逆序数为1。


  ]
    #Definition[
    *Definition 0.1.3.4* Second Definition of Determinant 行列式第二定义
    
    二阶及二阶以上的行列式（$n$阶）的行列式定义为：
    
    $ mat( delim: "|", a _ ( 11 ), a _ ( 12 ), dots.h.c, a _ ( 1 n ) ; dots.v, dots.v, , dots.v ; a _ ( i 1 ), a _ ( i 2 ), dots.h.c, a _ ( i n ) ; dots.v, dots.v, , dots.v ;  a _ ( n 1 ), a _ ( n 2 ), dots.h.c, a _ ( n n  ) ) = sum _ ( j _ ( 1 ), j _ ( 2 ) dots.h.c, j _ ( n ) )  ( - 1 ) ^ ( tau  (  j _ ( 1 ) j _ ( 2 )  dots.h.c j _ ( n ) ) ) a _ ( 1  j _ ( 1 )  ) a _ ( 2 j _ ( 2 ))  dots.h.c a _ ( n j _ ( n ) ) $


  ]
  这是啥意思呢？$tau(  j _ ( 1 ) j _ ( 2 )  dots.h.c j _ ( n ) )$是求$n$阶排列的逆序数。这个定义的意思是，我们要求$n$阶行列式，那我们就要把1到n进行全排列，并将每种情况下上述表达式计算并求和。通过一个例子解释就能懂了：

  #Example[
    *Example 0.1.3.1*

    $ mat( delim: "|", a _ ( 1 1), a _ (1 2 ), a _ (1 3 ) ; a _ (2 1 ), a _ (2 2 ), a _ (2  3 ) ; a _ (3  1 ), a _ (3 2 ), a _ (3 3 ) ) = a _ (1 1 ) a _ (2 2 ) a _ (3 3 ) + a _ (1 2 ) a _ (2 3 ) a _ (3  1 ) + a _ (1 3 ) a _ (2 1 ) a _ (3 2 ) - a _ ( 1 3) a _ ( 2 2 ) a _ ( 3 1 ) - a _ ( 1 1 ) a _ ( 2 3 ) a _ ( 3 2 ) - a _ ( 1 2 ) a _ ( 2  1) a _ ( 3 3 ) $

    我们首先固定第一个下标顺序为1，2，3，然后对3阶排列进行枚举，一共有$3 ! = 6$种，分别是：
    $(1,2,3),(1,3,2),(2,1,3),(2,3,1),(3,1,2),(3,2,1)$，对六种情况分别赋值给$j_i$，这就得到了$(a _ (1 1 ) a _ (2 2 ) a _ (3 3 ))  (a _ (1 2 ) a _ (2 3 ) a _ (3  1 )) ( a _ (1 3 ) a _ (2 1 ) a _ (3 2 ))  (a _ ( 1 3) a _ ( 2 2 ) a _ ( 3 1 ))  (a _ ( 1 1 ) a _ ( 2 3 ) a _ ( 3 2 )) (a _ ( 1 2 ) a _ ( 2  1) a _ ( 3 3 ))$，最后确定每项的正负号，则是通过$j_i$排列的逆序数来定。如$(1,2,3)$的逆序数为0，因此$(-1)^0 a _ (1 1 ) a _ (2 2 ) a _ (3 3 )$最终是正号，而$(1,3,2)$的逆序数为1，因此$(-1)^1 a _ (1 1 ) a _ (2 3 ) a _ (3  2 )$最终是负号，以此类推，得到结果。这就是通过第二种行列式定义下计算。]

=== 0.1.4.Third Definition of Determinant 行列式第三定义
  第三定义又称行列式展开定理。通过对某一行或某一列的展开，得到行列式的计算式。
  #Definition[
    *Definition 0.1.4.1* Minor 余子式

    设$A$是$n$阶矩阵，$a _ ( i j )$是$A$的一个元素，$M _ ( i j )$是$A$中去掉第$i$行第$j$列的子矩阵，$det(M _ ( i j ))$是$M _ ( i j )$的行列式，称为$a _ ( i j )$的余子式。

    $ M _ ( i ) = mat( a _ ( 11 ), dots.h.c, a _ ( 1, j - 1 ),a _ ( 1, j + 1 ), dots.h.c, a _ ( 1 n ) ; dots.v, , dots.v, dots.v,,dots.v; a _ ( i - 1, 1 ), dots.h.c, a _ ( i - 1, j - 1 ), a _ ( i - 1, j + 1 ), dots.h.c, a _ ( i _ ( i, n ) ) ; a _ ( i + 1, 1 ), dots.h.c, a _ ( i - 1, j - 1 ), a _ ( i + 1, j + 1 ), dots.h.c, a _ ( i _ ( i + 1, n ) ) ; dots.v, , dots.v, dots.v,, dots.v ;a _ ( n, 1 ),dots.h.c, a _ ( n, j - 1 ),a _ ( n, j+1 ), dots.h.c, a _ ( n n) ) $
  ]
  #Definition[
    *Definition 0.1.4.2* Cofactor 代数余子式

    设$A$是$n$阶矩阵，$M _ ( i j )$是对应$a _ ( i j )$的余子式，则记$A_(i j )$为代数余子式，其中$A_(i j )=(-1)^(i+j) M _ ( i j )$

  ]
  #Definition[
    *Definition 0.1.4.3* Third Definition of Determinant 行列式第三定义
    
    设$A$是$n$阶矩阵，其行列式等于某行元素或某列元素与对应代数余子式的乘积的和。即
    $ abs( A ) = cases( a _ ( i 1) A _ ( i 1) + a _ ( i 2 ) A _ ( i 2 ) + dots.h.c + a _ ( i n) A _ ( i n) = sum _ ( j = 1 ) ^ ( n ) a _ ( i j ) A _ ( i j ) ( i = 1 \, 2 \, dots.h.c \, n ) \,, a _ ( 1 _ j  ) A _ ( 1 j ) + a _ ( 2 j ) A _ ( 2 j ) + dots.h.c + a _ (  n j) A _ ( n j) = sum _ ( i = l ) ^ ( n ) a _ ( i j ) A _ ( i j ) ( j = 1 \, 2 \, dots.h.c \, n ). ) $
  ]
  当某一行或某一列元素和另一行或另一列的代数余子式相乘再求和，其值一定为0。
  #Example[
    *Example 0.1.4.1*

    $ D _ ( 4 ) = mat( delim: "|", 2, - 1, 0, 0 ; 0, 2, - 1, 0 ; 0, 0, 2, - 1 ; - 1, 0, 0, 2 ) $
  ]
  #Solution[
    *Solution*

    按照第一列展开，原式等于：

    $= 2 mat( delim: "|", 2, - 1, 0 ; 0, 2, - 1 ; 0, 2, - 1 ) - 1 times ( - 1 ) ^ ( 4 + 1 ) mat( delim: "|", 0, 0, 0 ; 2, - 1, 0 ; 0, 2, - 1 )=16-1=15$
    
  ]
=== 0.1.5.Some basic Calculation of Determinant 行列式的基本计算
  + 主对角线型
    
    $mat( delim: "|", a _ ( 1 1 ), a _ ( 12 ), dots.h.c, a _ ( 1 n ) ; 0, a _ ( 22 ), dots.h.c, a _ ( 2 n ) ; dots.v, dots.v, , dots.v ; 0, 0, dots.h.c, a _ ( n ) )=mat( delim: "|", a _ ( 11 ), 0,dots.h.c, 0 ; a _ ( 21 ), a _ ( 22 ), dots.h.c, 0 ; dots.v, dots.v,, dots.v  ; a _ ( n 1 ), a _ ( n 2 ), dots.h.c, a _ ( n n ) )= mat( delim: "|", a _ ( 11 ), 0, dots.h.c, 0 ; 0, a _ ( 22 ), dots.h.c, 0 ; dots.v, dots.v,, dots.v ; 0, 0, dots.h.c, a _ ( n ) ) = product _ ( i = 1 ) ^ ( a ) a _ ( i i ) $

  + 副对角线型

    $mat( delim: "|", a _ ( 11 ), dots.h.c, a _ ( 1, n - 1 ), a _ ( 1 n ) ; a _ ( 21 ), dots.h.c, a _ ( 2, n - 1 ), 0 ; dots.v,, dots.v, dots.v ; a _ ( n 1 ),dots.h.c, 0, 0 )=mat( delim: "|", 0, dots.h.c, 0, a _ ( 1 n ) ; 0, dots.h.c, a _ ( 2, n - 1 ), a _ ( 2 n ) ; dots.v,, dots.v, dots.v ; a _ ( n 1), dots.h.c, a _ ( n,n - 1 ), a _ ( n,n ) )=mat( delim: "|", 0, dots.h.c, 0, a _ ( 1 n ) ; 0, dots.h.c, a _ ( 2, n - 1 ), 0 ; dots.v,, dots.v, dots.v ; a _ ( n ), dots.h.c, 0, 0 )=( - 1 ) ^ ( ( n ( n - 1 ) ) / ( 2 ) ) a _ ( 1 ,n  ) a _ ( 2 , n - 1 ) dots.h.c a _ ( n , 1 )$

    前面的系数为第二定义下的一个逆序数，也可以使用交换行的方法得到。

  + 拉普拉斯展开式
    
    设*$A$*为$m$阶矩阵，*$B$*为$n$阶矩阵，则：

    $mat( delim: "|", A, 0 ; 0, B )=mat( delim: "|", A, 0 ; C, B )=mat( delim: "|", A, C ; 0, B )=det(A) det(B)$

     $mat( delim: "|", 0, A ;  B,0)=mat( delim: "|", C, A ;  B,0 )=mat( delim: "|", 0, A ;  B,C )=(-1)^(m n)det(A) det(B)$
  + 范德蒙德行列式

    $mat( delim: "|", 1,1, dots.h.c,1 ; x _ ( 1 ), x _ ( 2 ), dots.h.c, x_(n) ; x _ ( 1 ) ^ ( 2 ), x _ ( 2 ) ^ ( 2 ), dots.h.c, x _ ( n ) ^ ( 2 ) ; dots.v, dots.v, dots.v, dots.v ;  x _ ( 1 ) ^ ( n - 1 ), x _ ( 2 ) ^ ( n - 1 ), dots.h.c, x _ ( n ) ^ ( n - 1 ) ) = product _ ( l <= i < j <= n ) ( x _ ( j ) - x _ ( i ) )$

  计算行列式需要注意，加加减减能消去的一定要注意观察，先观察再动手计算会省掉很多麻烦。

=== 0.1.6.Cramer's Rule 克拉默法则

  #Definition[
    *Definition 0.1.6.1* Cramer's Rule 克拉默法则

    对n个方程n个未知数（前提）的非齐次线性方程组
    $ cases( a _ ( 11 ) x _ ( 1 ) + a _ ( 12 ) x _ ( 2 ) + dots.h.c + a _ ( 1 n ) x _ ( n ) = b _ ( 1 ) \,, a _ ( 21 ) x _ ( 1 ) + a _ ( 22 ) x _ ( 2 ) + dots.h.c + a _ ( 2 n ) x _ ( n ) = b _ ( 2 ) \,,dots.v \,, a _ ( n 1 ) x _ ( 1 ) + a _ ( 22 ) x _ ( 2 ) + dots.h.c + a _ ( n n ) x _ ( n ) = b _ ( n ) \, ) $若$ D  = mat( delim: "|", a _ ( 11 ), a _ ( 12 ), dots.h.c, a _ ( iota n ) ; a _ ( 21 ), a _ ( 22 ), dots.h.c, a _ ( 2 n ) ; dots.v, dots.v,, dots.v ; a _ ( n 1 ), a _ ( n 2 ),..., a _ ( n n) )!= 0$，则方程组有唯一解，且解为$ x _ ( i )  = ( D _ ( i ) ) / ( D ), i = 1, 2, dots.h.c, n$，其中$D_i$为常数项$b_1,b_2,dots.h.c,b_n$替换掉$D$中第$i$列元素得到的行列式。注意$D=0$则有无穷多解。
  ]
  










