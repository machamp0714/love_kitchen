# LoveKitchen

料理好きなユーザーが普段使っているアイテム(フライパン、包丁...)や  
調味料等をシェアできるサービスです。
http://lovekitchen.cf/

***DebugAccount:***

[email] alice@gmail.com  
[password] password

## 使用した技術

+ AWS
    + EC2
    + Route53
+ デプロイ  
    + capistrano
+ RSpec
    + 単体テスト
    + 統合テスト
+ 画像アップロード
    + carrierwave
    + rmagick
+ 検索
    + ransack
+ ユーザー認証
    + Devise
+ グラフ作成
    + Chart.js
+ DB
    + mysql
+ ページネーション
    + kaminari
+ デザイン
    + bootstrap
    + font-awesome-sass
+ 非同期通信

## 概要

料理好きな方の中には、他の方がどんなアイテム、調味料などを  
使って普段料理されているのか気になる方も多いと思います。  
LoveKitchenは、そのような方のための”こだわり”を共有できるサービスです。

## 機能

- 記事を投稿する(写真を複数添付、グラフの作成)
- コメントの送信
- 記事にいいねを付ける
- 記事をお気に入りに追加
- ユーザーをフォローする

## Requirement

ruby 2.5.3  
rails 5.2.2