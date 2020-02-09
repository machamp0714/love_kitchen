# LoveKitchen

料理好きなユーザーが普段使っているアイテム(フライパン、包丁...)や  
調味料等をシェアできるサービスです。
http://lovekitchen.ml/

**_DebugAccount:_**

[email] alice@gmail.com  
[password] password

## 使用した技術

- AWS
  - ECS
  - ECR
  - Route53
  - S3
  - RDS
  - ALB
- デプロイ
  - CircleCI
- RSpec
  - 単体テスト
  - 統合テスト
- 画像アップロード
  - carrierwave
  - rmagick
- 検索
  - ransack
- 通知機能
- ユーザー認証
  - Devise
  - TwitterAPI
- グラフ作成
  - Chart.js
- DB
  - mysql
- ページネーション
  - kaminari
- デザイン
  - bootstrap
  - font-awesome-sass
- 非同期通信

## AWS 構成図

![インフラ構成図](https://i.imgur.com/2jWWDKC.png)

## 概要

料理好きな方の中には、他の方がどんなアイテム、調味料などを  
使って普段料理されているのか気になる方も多いと思います。  
LoveKitchen は、そのような方のための”こだわり”を共有できるサービスです。

## 機能

- 記事を投稿する(写真を複数添付、グラフの作成)
- コメントの送信
- 記事にいいねを付ける
- 記事をお気に入りに追加
- ユーザーをフォローする
- 通知機能

## Requirement

ruby 2.5.3  
rails 5.2.2
