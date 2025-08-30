#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "Personal Information",
  desc: [This is a test post.],
  date: "2025-04-25",
  tags: (
    blog-tags.misc,
  ),
  show-outline: false,
)

= About me

#include "/content/other/about.typ"

= 个人信息

- 名字：官天瑜
- 生日：07月09日
- 年龄：23

= Personal Information

- Name：Tianyu Guan
- Birthday：07. 09
- Year：23
