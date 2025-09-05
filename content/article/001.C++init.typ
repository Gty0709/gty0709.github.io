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