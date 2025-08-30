#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "A brief introduction",
  desc: [This is a sketch of my life.],
  date: "2025-08-30",
  tags: (
    blog-tags.misc,
    blog-tags.intr,
  ),
  show-outline: false,
)
= About me
#include "/content/other/about.typ"

= 个人信息

- 名字：官天瑜
- 生日：7月9日
- 年龄：22

= Personal Information

- Name：Tianyu Guan
- Birthday：7. 9
- Year：22
