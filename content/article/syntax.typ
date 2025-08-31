#import "/typ/templates/blog.typ": *
#let blog-tags = (
  test: "Test",
  typst: "Typst",
)

#show: main.with(
  title: "Typst Syntax",
  desc: [A test blog. List of Typst Syntax, for rendering tests.],
  date: "2025-05-27",
  tags: (
    blog-tags.test,
    blog-tags.typst,
  ),
)

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
