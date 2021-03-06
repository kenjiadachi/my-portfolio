+++
author = "Kenji Adachi"
title = "[Rails]横から出てくるナビバー、simple-sidebarを導入する"
date = "2018-08-06"
description = "ナビバー以外にログインユーザーのみに表示するリンク一覧が欲しかったので、simple-sidebarを導入しました"
tags = ["Rails", "javascript", "jQuery", "Bootstrap4"]
categories = ["Rails"]
images  = ["img/header/how-to-install-simple-sidebar.png"]
type = "post"
draft =  false
+++

ナビバー以外にログインユーザーのみに表示するリンク一覧が欲しかったので、いろいろ探しているとこんなものを見つけ、さっそく導入してみました。

https://github.com/dcdeiv/simple-sidebar

[デモ](http://dcdeiv.github.io/simple-sidebar/left/)

------

**※こちらの記事は、Qiitaにて公開していたものを2020/03/01にこちらに移行しています。**

元記事は[こちら](https://qiita.com/dach1_ken/items/90bc9d813fde881a605a)

※現在はこちらのページのURLのみ記載されています。

--------

## 導入環境

- Rails 5.0.7
- jQuery
- turbolinks

--------

## 導入方法

https://github.com/dcdeiv/simple-sidebar/releases

ここから、zipファイルかtar.gzファイルをダウンロードします。

展開して、distフォルダの中からどちらか好きな方をapp/assets/javascripts/の中に入れます。

(自分は[Ruby On Rails AssetPipelineで読み込まれるJSの順番指定について](http://coa.hateblo.jp/entry/2012/08/03/093928)にあるようにして読込む順番を操作しています。こちらのようにする場合、これはapp/assets/javascripts/packagesに入れてます。)


下記ファイルを同じくapp/assets/javascripts/の中に作成します。

(上記のように読込む順番を操作している場合、これをあとで読み込むようにしておきます。自分はapp/assets/javascripts/appsの中に入れてます。)

```coffee
# simple-sidebar.js.coffee

$(document).on 'turbolinks:load', ->
  # 2018/08/15追記部分開始
  $('html').css('overflow', 'auto')
  # 2018/08/15追記部分終了
  $('#sidebar').simpleSidebar
    opener: '#button'
    wrapper: '#wrapper'
    sidebar:
      align: 'left'
      width: 200;
      closingLinks: '.close-sidebar'
```

あとはviewをこんな感じに変えるだけ。

(bootstrap4、devise、font-awesomeを使用してます。)

```html.haml
/ application.html.haml

%body.font_change#wrapper
  - if user_signed_in?
    %nav.bg-dark.py-5#sidebar
      %ul.navbar-nav.mx-4
        %li.nav-item.text-light.pt-3
          = link_to user_path(current_user), class: 'nav-link text-light' do
            = icon('far', 'user fa-fw')}
            マイページ
        %li.nav-item.text-light.pt-3
          = link_to destroy_user_session_path, method: :delete, class: 'nav-link text-light' do
            = icon('fas', 'sign-out-alt fa-fw')
            ログアウト
  = yield

```

----------

## 雑感

すごく簡単に、邪魔にならないサイドバーができるのでオススメです。

ただ、戻るボタンを押した時とかの挙動が不安定？な気も…

原因がわかり次第こちらに追記します。

----------

## 2018/08/15追記

>ただ、戻るボタンを押した時とかの挙動が不安定？な気も…

こちら、simple-sidebarを開いた状態でページを遷移すると、遷移先のページで画面がスクロールできないという症状が発生していることに気づきました。

原因は、<html>タグにstyle= overflow: hiddenが付いていることでした。

なんでこれがつくのかはわかりませんが、取り急ぎ上記の追記部分にて対応しました。

-------

## 参考にしたサイト

- [Ruby On Rails AssetPipelineで読み込まれるJSの順番指定について](http://coa.hateblo.jp/entry/2012/08/03/093928)
- [simple-sidebar - GitHub](https://github.com/dcdeiv/simple-sidebar)

-------

## こちらもぜひご一緒に！

- [[Rails]js-cookie.jsを使ってbootstrap4のタブの情報を保持する](../../blog/how-to-retain-the-information-of-bootstrap4-tab-using-js-cookie/)
- [[Rails]動的なvalidationをParsleyと、Bootstrap4を使っておしゃれに実装する](../../blog/how-to-use-parsely-in-rails/)
- [[Rails]ブログ機能を実装して、Herokuにuploadするまで](../../blog/how-to-create-blog-in-rails/)
