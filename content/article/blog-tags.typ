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
  test: "Test",
  tem: "Template"
)

#show: main.with(
  title: "TAGS",
  desc: [The fucking tags.],
  date: "2025-08-30",
  tags: (
    blog-tags.programming,
    blog-tags.typst,
    blog-tags.intr,
    blog-tags.misc,
    blog-tags.ROS,
    blog-tags.linux,
    blog-tags.compiler,
    blog-tags.music-theory,
    blog-tags.tinymist,
    blog-tags.dev-ops,
    blog-tags.tooling,
    blog-tags.software,
    blog-tags.software-engineering,
    blog-tags.test,
    blog-tags.tem
  ),
)
