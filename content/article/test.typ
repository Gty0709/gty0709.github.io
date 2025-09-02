#import "/typ/templates/blog.typ": *
#let blog-tags = (
  env: "Environment",
  blog: "Blog",
  typst: "Typst"
)
#show: main.with(
  title: "001.test",
  desc: [1111],
  date: "2025-05-27",
  tags: (
    blog-tags.env,
    blog-tags.blog,
    blog-tags.typst
  ),
)

= 我是标题
- 我是内容
#image("figures/001.png")
