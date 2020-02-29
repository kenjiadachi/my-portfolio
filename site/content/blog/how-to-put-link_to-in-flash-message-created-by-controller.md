---
title: "[Rails]controllerで作るflashメッセージの中にlink_toを入れる方法"
cover: "/images/test.jpg"
categories: ["dev"]
tags: ["Rails", "flash", "controller", "link_to"]
draft: true
---

Railsで、flashにLinkを入れたい時に調べるのに苦労したのでまとめておきます。

<!--more-->

## 結論

```ruby:controllers/application_controller.rb
if アラートを出したい条件
  text = "#{view_context.link_to 'こちら', hoge_path}をクリックしてください".html_safe
  flash[:hoge_alert] = text
else
  flash[:hoge_alert] = nil
end
```

## ポイント

- viewのヘルパーメソッドをcontroller内で使うときは `view_context` を使いましょう
- flashの消える条件をつけておきましょう。そうじゃないと画面更新時に `html_safe` がかかってない状態で表示されることがあります。
    - それに伴い、flashの名前には独自のものをつけておくことをお勧めします。他のアラートまで消えるのは嫌なので。

## ダメな例(僕がダメだった例)

調べてると、よくこんな解決策が出てきます。

[link_to() in Rails flash](https://stackoverflow.com/questions/1598150/link-to-in-rails-flash)とか。

```ruby:controllers/application_controller.rb
flash[:error] = render_to_string(:partial => "shared/login_failed_message")
```


```erb:shared/_login_failed_message.html.erb
<%= "Login failed.  If you have forgotten your password, you can #{link_to('reset it', reset_path)}" %>
```

ただ、これだと他の`render`と重複した時に不思議な挙動になったので、やめておいたほうがいいかもです。
