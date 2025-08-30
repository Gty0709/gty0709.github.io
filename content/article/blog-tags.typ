#import "/typ/templates/blog.typ": *
#let blog-tags = (
  programming: "Programming",
  software: "Software",
  software-engineering: "Software Engineering",
  tooling: "Tooling",
  linux: "Linux",
  dev-ops: "DevOps",
  compiler: "Compiler",
  music-theory: "Music Theory",
  tinymist: "Tinymist",
  typst: "Typst",
  misc: "Miscellaneous",
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
