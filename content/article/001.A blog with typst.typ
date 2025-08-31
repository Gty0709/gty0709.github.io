#import "/typ/templates/blog.typ": *
#let blog-tags = (
  env: "Environment",
  blog: "Blog",
  typst: "Typst"
)
#show: main.with(
  title: "Typst Syntax111",
  desc: [A test blog. List of Typst Syntax, for rendering tests.],
  date: "2025-08-30",
  tags: (
    blog-tags.env,
    blog-tags.blog,
    blog-tags.typst
  ),
)
= Preface
该教程旨在帮助新手快速使用typst撰写博客与文档
