#import "/typ/templates/blog.typ": *
#let blog-tags = (
  env: "Environment",
  blog: "Blog",
  typst: "Typst"
)
#show: main.with(
  title: "001.A Blog wit typst - 使用typst并搭建博客配置教程",
  desc: [一个基于typst和Astro模板的建站教程],
  date: "2025-08-31",
  tags: (
    blog-tags.env,
    blog-tags.blog,
    blog-tags.typst
  ),
)
= Preface
该教程旨在帮助新手快速搭建可用typst撰写的博客与文档。
+ 了解typst的基本语法和用法
  + 学习如何使用typst编写文档
    + 掌握typst的基本命令和结构

