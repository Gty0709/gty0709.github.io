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
== 0.1.Determinant (行列式)
  - In the study of linear algebra, the determinant is typically the first concept introduced. However, its underlying meaning is seldom explained by instructors; instead, students are often trained mechanically to carry out determinant computations. In what follows, we present three distinct definitions of the determinant.

    我们线性代数一般接触的第一个概念就是行列式。但是从来没有老师告诉过我们行列式是什么。我们像被训练机器一样训练去计算行列式！为了展示其本质与方便理解，我们将通过三种方式定义行列式。
  #Definition[*Def 0.1.1* Determinant 行列式
  
  The determinant of a matrix $A$ is a *geometry metric* that is defined by the following denotion:

  行列式 $D _ A$ 是一个几何度量标量，定义为以下符号：

  $ D _ ( n ) = mat( delim: "|", a _ ( 11 ), dots.h.c, a _ ( 1 n ) ; dots.v,, dots.v ; a _ ( 11 ), dots.h.c, a _ ( n n ) ) $

  where $a _ ( i j )$ is the entry in the $i$th row and $j$th column of $A$.

  其中 $a _ ( i j )$ 是矩阵 $A$ 的第 $i$ 行第 $j$ 列的元素。

  ]

    Let's see a determinant of $RR^2$ matrix. $D _ ( 1 ) = mat( delim: "|", a _ ( 11 ), a _ ( 12 ) ; a _ ( 21 ), a _ ( 22 ) ) $. It's not hard to figure out that the determinant of a $2 × 2$ matrix is the product of the two entries on the main diagonal:
     
  为什么说是几何度量？我们看到以下2×2矩阵的行列式，不难计算出其行列式的值:

   $ D _ ( 2 ) = mat( delim: "|", a _ ( 11 ), a _ ( 12 ) ; a _ ( 21 ), a _ ( 22 ) ) = a _ ( 11 ) a _ ( 22 ) - a _ ( 12 ) a _ ( 21) $

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
    //画线：mark参数表示起点终点标记
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
    cetz.angle.angle((0,0), (1,0.5), (0.5,1),
      label: text(green, [#sym.alpha]))
    line((0,0), (1,0.5),mark: (end: "stealth"))
    line((0,0), (0.5,1),mark: (end: "stealth"))
    anchor("O",(0,0))
    content("O", [$O$], anchor: "north-east", padding: .1)
    anchor("A",(1,0.5))
    content("A", [$A$], anchor: "north", padding: .1)
    anchor("B",(0.5,1))
    content("B", [$B$], anchor: "east", padding: .1)
    anchor("O",(0,0))
    content("O", [$O$], anchor: "north-east", padding: .1)

    set-style(stroke: (thickness: 1.2pt))

    // line((30deg, 1), ((), "|-", (0,0)), stroke: (paint: red), name: "sin")
    // content(("sin.start", 50%, "sin.end"), text(red)[$ sin alpha $])
    // line("sin.end", (0,0), stroke: (paint: blue), name: "cos")
    // content(("cos.start", 50%, "cos.end"), text(blue)[$ cos alpha $], anchor: "north")
    // line((1, 0), (1, calc.tan(30deg)), name: "tan", stroke: (paint: orange))
    // content("tan.end", $ text(#orange, tan alpha) = text(#red, sin alpha) / text(#blue, cos alpha) $, anchor: "west")
  })

