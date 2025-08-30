
#import "/typ/templates/mod.typ": sys-is-html-target

// If the site is not bundled my artwork, don't show it
#let show-artwork = false
#let is-external = state("about:is-external", false)

#let en = text.with(lang: "en")
#let zh = text.with(lang: "zh")

#en[
  “My life is dedicated to chasing genius. I don't want to just look up to them, resonate with them, or stand on their shoulders. I want to stand shoulder to shoulder with them. I will spend my life proving that hard work, sweat, focus, and perseverance are far more important than talent and background. The most important thing is that you can definitely catch up with the geniuses by relying on them. When I become a top figure in a certain field, this proof will only be half complete. Only when a second person touches my tombstone, steps over my corpse, looks at my works or articles countless years later, and shares a knowing smile with the long-dead me, giving rise to the idea of chasing genius, will this proof be complete.”
//德语版本

  _"Mein Leben war der Jagd nach Genies gewidmet, ich will nicht nur zu ihnen aufschauen, ich will nicht nur mit ihnen in Resonanz gehen, ich will nicht nur auf ihren Schultern stehen, ich will Schulter an Schulter mit ihnen stehen; Ich werde mein Leben lang beweisen, dass harte Arbeit, Schweiß, Fokus und Ausdauer viel wichtiger sind als Talent und Herkunft; Das Wichtigste ist, dass Sie die Genies definitiv einholen können, indem Sie sich auf sie verlassen. Wenn ich eine Top-Person in einem Bereich werde, ist dieser Beweis erst zur Hälfte fertig; Dieser Beweis ist erst dann vollständig, wenn eine zweite Person meinen Grabstein berührt, auf meinen Leichnam tritt, unzählige Jahre später meine Schriften oder Artikel anschaut, mich anschaut, der schon lange verstorben ist, wissend lächelt und auf die Idee kommt, ein Genie zu jagen."_
]

#zh[
  “我的一生致力于追逐天才，不想仅仅仰望他们，不想仅仅与他们共鸣，不想仅仅站在他们的肩膀上，我想和他们肩并肩；我将终其一生证明努力，汗水，专注和坚持是远比天资和出身重要，最重要的是，靠着它们一定能追上天才们的步伐；当我成为某个领域的顶尖人物时，这个证明将只完成一半；当且仅当有第二个人摸着我的墓碑，踏着我的尸体前进，在无数年后看着我的著作或文章，和早已逝世的我对视并会心一笑，萌生追逐天才的想法时，这个证明才算完成。”
]

#en[
  = 2025.08.31 00:32
]

#en[
  This blog is aimed at sharing my thoughts and experiences in the fields of mathematics and robotics, haha,the lecture notes mostly.
  I was graduated from SCUT in _Jun 30th_, 2025, with a bachelor degree in *civil-engineering*, and now work as a Masterate student in _Tongji_ in intelligent construction. My dream is to turn automation in construction into reality, which acquires a variety of knowledge in robotic and AI. I will continue to learn and post my notes on this
  blog. Besides, I fall in love with maths. I will dedicate my spare time to exploring the beauty of mathematics and sharing my viewpoints with others. 

  _I Have A Dream, I want to finish my doctoral degree in ETH Zurich of control engineering and robotics in the future. I will try to achieve this goal step by step!_
]

#zh[
  这个博客旨在分享我的数学和机器人领域的想法和经验，哈哈，主要是讲义笔记。
  我于2025年6月30日毕业于华南理工大学，获得土木工程学士学位，现在是一名同济大学的智能建造专业硕士研究生。我的梦想是将建筑中的自动化变为现实，这需要在机器人和人工智能方面的多种知识。我将继续学习并在这个博客上发布我的笔记。此外，我爱上了数学。我将把业余时间献给探索数学之美，并与他人分享我的观点。

  _我有一个梦想，我希望将来在苏黎世联邦理工学院攻读控制工程和机器人博士学位。我会一步一步地实现这个目标！_
]

#en[
  I post my first blog for 2 days because I have known nothing in _javascript_, _css_ and _html_. It's time to say "hello world!".
  Some new progress will be published here, stay tuned!
]

#zh[
  我在这里发布我的第一篇博客，居然耗时两天！因为我对 _javascript_、_css_ 和 _html_ 一无所知。是时候说“你好，世界！”了。
  一些新的进展将在这里发布，敬请期待！
]

#link("https://github.com/Gty0709")[GitHub]

#link("https://space.bilibili.com/288744148")[Bilibili]


// #if sys-is-html-target and show-artwork {
//   {
//     show raw: it => html.elem("style", it.text)
//     ```css
//     .self-desc .thumbnail-container {
//       flex: 0 0 22em;
//       border-radius: 0.5em;
//       overflow: hidden;
//       margin-left: 2em;
//       margin-block-start: -1em;
//       margin-block-end: 2em;
//     }

//     .self-desc .thumbnail-container,
//     .self-desc .thumbnail {
//       float: right;
//       width: 22em;
//       height: 22em;
//     }

//     .thumbnail {
//       --thumbnail-fg: var(--main-color);
//       --thumbnail-bg: transparent;
//     }

//     .dark .thumbnail {
//       --thumbnail-bg: var(--main-color);
//       --thumbnail-fg: transparent;
//     }

//     @media (max-width: 800px) {
//       .self-desc {
//         display: flex;
//         gap: 1em;
//         flex-direction: column-reverse;
//         align-items: center;
//       }
//       .self-desc .thumbnail-container {
//         margin-block-start: 0em;
//         margin-block-end: 0em;
//       }
//       .self-desc .thumbnail-container,
//       .self-desc .thumbnail {
//         width: 100%;
//         height: 100%;
//       }
//     }
//     ```
//   }

//   let div = html.elem.with("div")
//   let svg = html.elem.with("svg")

//   let artwork = svg(
//     attrs: (
//       class: "thumbnail",
//       xmlns: "http://www.w3.org/2000/svg",
//       viewBox: "0 0 640 640",
//     ),
//     {
//       let count-path() = {
//         let data = str(read("/public/favicon.svg"))
//         let fgs = regex("thumbnail-fg\d+")
//         let bgs = regex("thumbnail-bg\d+")
//         (data.matches(fgs).len(), data.matches(bgs).len())
//       }

//       let (fgs, bgs) = count-path()

//       for i in range(bgs) {
//         html.elem(
//           "use",
//           attrs: (
//             "xlink:href": "/favicon.svg#thumbnail-bg" + str(i),
//             style: "fill: var(--thumbnail-bg)",
//           ),
//         )
//       }
//       for i in range(fgs) {
//         html.elem(
//           "use",
//           attrs: (
//             "xlink:href": "/favicon.svg#thumbnail-fg" + str(i),
//             style: "fill: var(--thumbnail-fg)",
//           ),
//         )
//       }
//     },
//   )

//   div(
//     attrs: (
//       class: "self-desc",
//     ),
//     {
//       context div(
//         attrs: (
//           class: "thumbnail-container link",
//           title: "礼羽みや, artwork by ちょみます (@tyomimas)",
//           onclick: if is-external.get() {
//             "location.href='https://www.myriad-dreamin.com/article/personal-info'"
//           } else {
//             "location.href='/article/personal-info'"
//           },
//         ),
//         artwork,
//       )
//       div(self-desc)
//     },
//   )
// } else {
//   self-desc
// }

// // #context if is-external.get() {
// //   show "PoeMagie": link.with("https://www.myriad-dreamin.com")

// //   [= My Blog]

// //   blog-desc
// // } else {
// //   [= Regional Mirror]
// // }

#en[
  = 2025.0X.0x

  to be updated...
]

#zh[
  待更新...
]