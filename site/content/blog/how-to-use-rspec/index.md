+++
author = "Kenji Adachi"
title = "[Rails]RSpecことはじめ ~使いやすい環境構築~"
date = "2020-05-31"
description = "RSpecはいいぞ"
tags = ["Rails", "RSpec"]
categories = ["Rails"]
images  = ["img/header/how-to-use-rspec.png"]
type = "post"
draft =  false
+++

最近テストにはまっています。

いらんことに脳のリソースをさかれない状態で開発を進めたいですよね。

そんなわけで今回は、Ruby on Railsの代表的なテストツールRSpecをご紹介します。

-------

<!--more-->

## ことばの紹介

まずは知らない方もいるかと思うので、ことばの紹介から。

わかってるよ！って人は飛ばしてください。

-------

### RSpecとは

[こちらの記事](https://machiiro.github.io/bootcamp/rspec/base/01_about.html)が分かりやすかったので引用させていただきます。

> RSpec とは、Ruby における BDD (behavior driven development、ビヘイビア駆動開発) のためのテストフレームワークです。 BDD という言葉に聞き慣れないかもしれませんが、 テストコードを、自然言語を用いて要求仕様のように (Spec = 仕様) 記述するための手法です。

テストによって振る舞いを決めるためのツールということですね。

TDD(テスト駆動開発)の基盤となっているBDDという概念についてはまた別記事でご紹介したいと思います。

-------

## 使ってみましょう

それでは早速RSpecを使ってみましょう。

僕が個人的にイチオシの本があるので、こちらをもとに進めます。

[Everyday Rails - RSpecによるRailsテスト入門](https://leanpub.com/everydayrailsrspec-jp)

さて、早速ですが`Gemfile`に以下を追記してください。

```
# Gemfile

# 省略
group :development, :test do
  # 省略
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end
```

その後`bundle install`を実行してください。

そのまま脳死で`rails g rspec:install`としてください。

すると、以下のような感じになるはずです。

```
Running via Spring preloader in process 9045
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
```

その後、それぞれのファイルを編集していきましょう。

```
# config/application.rb

config.generators do |g|
  g.test_framework :rspec,
  fixtures: false,
  view_specs: false,
  helper_specs: false,
  routing_specs: false
end
```

```
# .rspec

--require spec_helper
--format documentation
```

```
# spec/rails_helper.rb

# 省略
RSpec.configure do |config|

  # 省略
  config.include FactoryBot::Syntax::Methods

end
```

こんな感じで設定すれば、キレイに動くはずです。

またテストの書き方については別記事で書きますね。

今日はこのあたりで。

-------

## 参考にした記事

- [[Docker知識不要]Docker上でのHugo環境の作り方](https://qiita.com/you1978/items/204c2cf75f86043dfe68)
- [HugoでWebサイトを立ち上げる+テーマを適用してみる](https://qiita.com/bake0937/items/e0914efbd9434be474a4)
- [Hugo Part 2 - Hugo で github にブログを立ち上げる](http://blog.syati.info/post/create_hugo_2/)
- [hugo-theme-dreamのドキュメント](https://g1eny0ung.site/hugo-theme-dream/#/)

-------

## こちらもぜひご一緒に！

- [[Hugo]faviconを設定する方法](../../blog/how-to-set-favicon/)
- [[Hugo]Hugoを使いこなすためのオススメファイル構造](../../blog/file-structure-for-mastering-hugo/)
