---
title: Hugoをつかってポートフォリオを作ってみたよ
date: 2020-01-05T02:44:26Z
lastmod: 2020-01-05T02:44:26Z
author: だちけん
cover: /images/test.jpg
categories: ["Dev"]
tags: ["Hugo", "portfolio", "Docker", "GitHub Pages"]
# showcase: true
draft: false
---

Hugoをつかってこのページを作ってみたので、作り方をまとめてみました。

ローカルでは、Dockerを用いて仮想環境上で動かしています。

また、ホスティングサービスはGitHub Pagesを用いています。

この記事では、HugoをDocker上で動かし、それをGitHub Pagesで公開するまでをご紹介します。

<!--more-->

## ことばの紹介

まずは知らない方もいるかと思うので、ことばの紹介から。

わかってるよ！って人は飛ばしてください。

### Hugoとは？

[Hugoの公式ページ](https://gohugo.io/)によると、

> Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites fun again.

Google翻訳にぶちこむと

> Hugoは、最も人気のあるオープンソースの静的サイトジェネレーターの1つです。その驚くべき速度と柔軟性により、HugoはWebサイトの構築を再び楽しくします。

とのことです。

これまで、BlogなどはWordPressが主流でしたが、わざわざ全ての機能を管理画面からしなくてもよくない？という流れから、このような静的サイトジェネレーターが流行り出しているのかなあという個人的な見解です。

WordPress、ちょっと触っただけでも結構めんどくさいですもんね…

その点、このような静的サイトジェネレーターだとファイルの移動とかするだけで簡単に思った通りになる、というのがいいところかなあと思います。


### Dockerとは？

これも[Dockerの公式ページ]()によると、

> The only independent container platform that enables organizations to seamlessly build, share and run any application, anywhere—from hybrid cloud to the edge.

はたまたGoogle翻訳にぶちこむと

> 組織がハイブリッドクラウドからエッジまで、あらゆるアプリケーションをシームレスに構築、共有、実行できるようにする唯一の独立したコンテナプラットフォーム。

誰とでも簡単に開発環境を共有できるプラットフォーム、といった感じですかね。

僕個人としては、けっこう一人で開発などすることが多いのであまりそのような面では恩恵を受けられていないのですが、ローカルのPCの環境をできるだけ汚したくないので新しいPCに変えてからはDockerを個人でも使用するようにしています。

`rbenv`とか`pyenv`とかあるにはあるけどめんどくさいですもんね。

こっちのバージョンでは入ってるけど、こっちでは入ってなかったっけ？とか。

そーゆーのもふくめて、簡単に作って壊してできるのがDockerのよさかなあと個人でやっている身からは思います。

### GitHub Pagesとは？


## つくっていきましょう

### Dockerの環境準備

### Hugoの設定

### GitHub Pagesで公開


## カスタマイズしよう

### Hugoのテーマを探そう

### テーマに合わせたセッティングをしよう
