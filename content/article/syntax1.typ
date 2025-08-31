#import "/typ/templates/blog.typ": *
#let blog-tags = (
  programming: "Programming",
  typst: "Typst",
  intr: "Introduction",
)
#show: main.with(
  title: "Typst Syntax111",
  desc: [List of Typst Syntax, for rendering tests.],
  date: "2025-08-30",
  tags: (
    blog-tags.programming,
    blog-tags.typst,
    blog-tags.intr,
  ),
)
//定义示例块
#let Example(body)={
  box(
    width: 100%,fill: rgb(223,238,214),stroke:rgb("#446c2c"),radius: 5pt,inset: 10pt,body
  )
}
//定义定义块
#let Definition(body)={
  box(
    width: 100%,fill: rgb("#f5d6d6"),stroke:rgb("#bd2f2f"),radius: 5pt,inset: 10pt,body
  )
}
//定义引理块
#let Lemma(body)={
  box(
    width: 100%,fill: rgb("#d6e6f5"),stroke:rgb("#2e74b1"),radius: 5pt,inset: 10pt,body
  )
}
//定义解题块
#let Solution(body)={
  box(
    width: 100%,stroke:rgb("#000000"),radius: 5pt,inset: 10pt,body
  )
}
//定义定理块
#let Theorem(body)={
  box(
    width: 100%,fill: rgb("#f5f1d6"),stroke:rgb("#b19a2e"),radius: 5pt,inset: 10pt,body
  )
}
//定义推论块
#let Proposition(body)={
  box(
    width: 100%,fill: rgb("#e8dfec"),stroke:rgb("#835799"),radius: 5pt,inset: 10pt,body
  )
}
//定义证明块
#let Proof(body)={
  box(
    width: 100%,fill: rgb("F5F5F5"),stroke:rgb("000000"),radius: 5pt,inset: 10pt,body
  )
}

= Raw Blocks

This is an inline raw block `class T`.

This is an inline raw block ```js class T```.

This is a long inline raw block ```js class T {}; class T {}; class T {}; class T {}; class T {}; class T {}; class T {}; class T {}; class T {};```.

Js syntax highlight are handled by syntect:

```js
class T {};
```

Typst syntax hightlight are specially handled internally:

```typ
#let f(x) = x;
```
$2+1=3$
+ 今天吃什么
  + 我已
  + 我是
    ```
    include<iostream>
    ```
  + 233$(1/2)+(3/4) $

// #box(width: 100%,fill: rgb(223,238,214),stroke:rgb(114,180,74),radius: 5pt,inset: 10pt)[
//   1. 求 $f(x) = x^2 - 4x + 3$ 的最值。
// ]
// #box(width: 100%,radius: 5pt,inset: 10pt,fill:rgb(223,238,214),stroke:rgb(114,180,74))[
//   解 ：
//   通过配方得：
//   $
//     f(x) = (x-2)^2 - 1
//   $

//   当 $x = 2$ 时，函数取最小值 $-1$。
// ]

#Example[  
  EX_1. 求 $f(x) = x^2 - 4x + 3$ 的最值。
  ]

#Solution[秒杀。]

#Definition[Def_2. 全纯函数]
== 设 $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
#Example[  
  EX_1. 求 $f(x) = x^2 - 4x + 3$ 的最值。
  ]

#Example[  
  EX_1. 求 $f(x) = x^2 - 4x + 3$ 的最值。
  ]

== 设 $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
= 我牛
== 打一桶
=== 加法公理 by DAvinqi
+ 输了
+ 哎
  + 输了

    #Lemma[*Axiom.*
      $1+2=3$
      ]
  + LaTeX so beautiful.
    
    #Theorem[*The_2.Fundamental Theorem of Algebra.*
    
    $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
]

    #Proof[*Proof.*
    
    s设 $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
    ]

    #Proposition[*Pro_1.Cauchy Integral Formula.*
    
    $f(z)$ 在 $D$ 内全纯，且 $f(z)$ 在 $D$ 内有界，则 $f(z)$ 在 $D$ 内有最大值。
    ]

    #Solution[*Solution.*
    证明：秒杀。ming is a good boy.
    
    ]

= 戴金分割
== 很难证明
#Theorem[*The_3.*

$QQ$ is a subset of $RR$. And $RR$ has #emph[LUB] property, please prove that;]

#Proof[*Proof.*
  设 $M = sup QQ$，则 $M \in RR$。
  由于 $RR$ 有 LUB 性质，故 $M$ 是 $RR$ 的上界。
  由此可知，$M$ 是 $QQ$ 的上界。
]