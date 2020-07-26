+++
author = "Kenji Adachi"
title = "[Hugo]Hugoを使いこなすためのオススメファイル構造"
date = "2020-05-13"
description = "しばらくHugoを使う中で気づいたのが、よくファイル構造に迷わされるということ"
tags = ["Hugo"]
categories = ["Hugo"]
images  = ["img/header/file-structure-for-mastering-hugo.png"]
type = "post"
draft = false
+++

しばらくHugoを使う中で気づいたのが、よくファイル構造に迷わされるということ。

いろいろ方法は準備してくれているのですが、そのどれをどのタイミングで使うかにいつも迷ってしまうんですよね…

3ヶ月ほどHugoを使ってきたので、その中で落ち着いたファイル構造について今回はまとめてみました。

-------

<!--more-->

## Hugoのファイル構造機能

まずはそもそも、ファイル構造の機能をまとめてみました。

-------

### デフォルト

デフォルトの機能では、ファイル構造はこのようになるかと思います。
```
.
├── content
|   └── posts
|       ├── firstpost.md  // <- https://example.com/posts/firstpost/
|       └── secondpost.md // <- https://example.com/posts/secondpost/
└── static
    ├── img1.png
    └── img2.png
```

このような形で、画像を挿入したい場合は`static`フォルダ内に入れて、`{{- $image := resources.Get “img1.png” -}}`このような形で呼び出すのが基本の設定となっています。

-------

### ページバンドル

先ほどご紹介したデフォルトの機能では、画像を差し替えたい！となった場合に遠くの`static`ディレクトリを管理せねばならず、不便ですよね。

そこで、ページバンドルという方法がHugoには準備されています。

ページバンドルには、リーフバンドル、ブランチバンドルという2種類があるので今からそれらの詳細になります。

[こちら](https://maku77.github.io/hugo/misc/page-bundle.html)のページがすごく分かりやすかったので、参照させていただきます。

(個人的に使いやすいリーフ版ドルをメインにご紹介したいので、順序は逆になっています。)

```
.
└── content
    └── about
    |   ├── index.md // <- https://example.com/about/ (リーフバンドル)
    |   └── img
    |       └── img1.png
    └── posts
        ├── _index.md // <- https://example.com/posts/ (ブランチバンドル)
        ├── img1.png
        └── happy
            └── index.md // <- https://example.com/posts/happy/ness/ (リーフバンドル)
```

-------

#### リーフバンドル

リーフ(葉)なので、一番先端になるイメージ。

index.htmlをつくれば、以降はすべてこの中身として扱われます。

> - `index.md`を持つディレクトリ。いわゆるシングルページに、専用のディレクトリを割り当てたもの。
> - 入れ子で別のバンドルは含められない。だから、ブランチ（枝）に対して、リーフ（葉）という名前が付けられている。
> - リソースファイル用のサブディレクトリを持つことができる。このディレクトリ以下に置いた `index.md`以外のファイルは、どんなに深いディレクトリに置こうが、この Leaf Bundle のリソースである。だから、`index.md`から参照する画像ファイルは、それ以下の階層であればどこにでも置ける。
> - Markdown ファイル (.md) でさえ、このディレクトリ内に配置したら、Leaf Bundle のリソースという扱いになる（単独で表示する記事ページとはみなされない）。

-------

#### ブランチバンドル

こちらは、ブランチ(枝)なので、その先がある可能性もあるイメージですね。

> - `_index.md` を持つディレクトリ。いわゆるセクションページに、画像などのリソースをくっつけたもの。
> - 入れ子で別のバンドルを含むことができる（子ページを持てることと同義）。
> - リソースファイル用のサブディレクトリを持つことはできない（サブディレクトリは、あくまで別のページ用に作るものである）。だから、`_index.md`から参照する画像ファイルなどは、`_index.md`と同じディレクトリ内に並べて置く必要がある。
> - このディレクトリ以下に配置した Markdown ファイル (.md) は、別の独立したシングルページとして存在することになる（当たり前のように思えるけど、下の Leaf Bundle の場合はちょっと違う扱いになる）。

-------

## オススメファイル構造

さて、ようやくぼくのオススメファイル構造のご紹介です。

以下のような感じですね。

みて分かる通り、リーフバンドルをベースに活用しています。

```
.
├── content
|   └── posts
|       └── <blogName>  
|           ├── index.md // <- https://example.com/<blogName>/ (リーフバンドル)
|           └── img
|               └── 1.png
└── static
    └── header
        └── <blogName>.png
```

ポイントは以下の2つですね。

-------

### 記事と記事内の画像はリーフバンドルで設定

基本的にはリーフバンドルを活用しています。

`<blogName>/index.md`が記事ですね。

その中で使う画像は、基本的には`<blogName>/img`内に入れています。

-------

### ヘッダー画像がある場合は、static内に入れる

ただ、ヘッダー画像の場合は注意が必要です。

ヘッダー画像はリーフバンドルでは管理できないようなので、ヘッダー画像のみ`static/header`に入れる運用としています。

ややこしいので、`<blogName>.png`にしています。

ほかにも、`static`内には`favicon`や`css/add-on.css`、`js/add-on.css`などが入っています。

今日はこのあたりで。

---------

## 参考にした記事
- [画像ファイルを Markdown ファイルと同じディレクトリに置く (Page Bundle)](https://maku77.github.io/hugo/misc/page-bundle.html)
- [Page Bundles - HUGO](https://gohugo.io/content-management/page-bundles)

--------

## こちらもぜひご一緒に！

- [[Hugo]faviconを設定する方法](../../blog/how-to-set-favicon/)
- [[Hugo]Docker上で管理できるポートフォリオを作ってみたよ](../../blog/how-to-create-this-page/)