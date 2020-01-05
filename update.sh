#!/bin/bash

# 既存のdocsフォルダの削除
rm -rf docs

# docsファイルの作成
docker-compose exec web hugo -t hugo-book

# docsファイルの移動
mv site/public docs

# Commit comment
ct="$(date +'%Y:%m:%d-%H:%M:%S')"

# Management
git add .
git commit -m $ct
git push
