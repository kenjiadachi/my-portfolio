---
title: "[Ransack]検索情報を保持するcheck_box_tagの作り方"
cover: "/images/test.jpg"
categories: ["dev"]
tags: ["Rails", "Ransack", "LiveDeli"]
draft: true
---

# 困りごと

ransackの検索後の画面を見たときに検索条件がcheck_boxに保持されていないので、検索条件がわからない！
(URLを見ればわかるけど、ユーザーにそこまでのリテラシーがあるとも思えない…)

# 前提条件

- enumで値を扱っている

```ruby:models/post.rb
class Post < ApplicationRecord
  enum tag: { report: 0, interview: 1, info: 2}
  #- 以下略
end
```

- `enum_help`で日本語化している

```ruby:Gemfile
gem 'enum_help'
```

```yml:config/locales/ja.yml
ja:
  enums:
    post:
      tag:
        report: 開催レポート
        interview: インタビュー
        info: お知らせ
```

- `ransack`で検索を実装している

```ruby:controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @search = Post.ransack(params[:q])
    @result = @search.result
  end
  #- 以下略
end
```

```haml:views/posts/index.html.haml
= search_form_for @search do |f|
  -#　以下略
  = f.submit "検索"
```

# 解決策

こんな感じで実装してみました。

```haml:views/posts/index.html.haml
= search_form_for @search do |f|
  - Post.tags_i18n.each do |tag|
    = check_box_tag('q[tag_eq_any][]', Post.tags[tag.first], params[:q].present?&&params[:q]["tag_eq_any"].present?&&params[:q]["tag_eq_any"].include?("#{Post.tags[tag.first]}")
    = tag.last
  = f.submit "検索"
```

# 解説

`Post.tags_i18n`では、このようなhashが返ってきます。
`{"report"=>"開催レポート", "interview"=>"インタビュー", "info"=>"お知らせ"}`

なので、`Post.tags_i18n.first`は
`["report", "開催レポート"]`という配列になります。

また、`Post.tags`は、このようなhashになるので、
`{"report"=>0, "interview"=>1, "info"=>2}`

`Post.tags[Post.tags_i18n.first.first]`は、0になります。

誰かの役に立っていればいいなあ。
