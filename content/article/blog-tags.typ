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
  ROS: "ROS",
)

#show: main.with(
  title: "TAGS",
  desc: [The fucking tags.],
  date: "2025-08-30",
  tags: (
    blog-tags.programming,
    blog-tags.typst,
    blog-tags.intr,
  ),
)
