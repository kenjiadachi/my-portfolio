---
title: "[Rails]render partial collectionでeach_with_indexができる話"
cover: "/images/test.jpg"
categories: ["dev"]
tags: ["Rails", "LiveDeli"]
draft: true
---


# 困りごと

調べ始めるきっかけはこの記事でした。
[パーシャルをrenderする際のパフォーマンスに関する注意点](https://qiita.com/itmammoth/items/612efc6ad3280349b7e1)

とりあえず、`each`内で`render partial: 'posts/post', locals: { post: post }`みたいにそれぞれに`locals`で変数渡すぐらいなら`render partial: 'posts/post', collection: @posts`みたいに`collection`にしちゃおう！その方が高速だよ！という話でした。

この記事を読んで早速自分の書いたコードを直していたのですが、どうするんだろう…ってなったのがこの部分。

```haml:view.html.haml
- post.comments.each_with_index do |comment, idx|
  = render partial: 'posts/partials/comment', locals: {comment: comment, idx: idx}
```

このように、`partial`内で`index`も使いたい場合はどうするのかなーと思い調べてみました。

# 解決策

```haml:view.html.haml
= render partial: 'posts/partials/comment', collection: post.comments, as: :comment
```

```haml:posts/partials/_comment.html.haml
- if comment_counter == 0
  -# 一つ目の挙動
- else
  -# それ以外の挙動
```

このように、`as`で指定した`comment`に`_counter`をつけると、`index`の役割を果たしてくれそう。
[Render partial with collection has "hidden" index](https://coderwall.com/p/t0no0g/render-partial-with-collection-has-hidden-index)のコメントにありました。
省略できる形の場所にある`partial`についての`index`指定方法は日本語の記事が見つかったのですが、省略できない場所の`partial`についての記事がなかったので、書いてみました。
