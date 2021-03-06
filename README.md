# README

# アプリ名
**Good Question**

# 概要
* 音声入力機能を備えたタスク管理アプリです。
* ユーザーは音声入力機能により簡単にタスク管理を行う事が出来ます。
* ユーザーはタスクを管理する上で出てきた疑問点を他ユーザーに音声入力によるチャットで質問出来ます。

# アプリ利用情報
URL : http://175.41.209.177/  
※マイク機能がブロックされると音声入力機能が動作しません。その場合はローカルでご検証下さい。  

■テスト用アカウント  
Eメール        : test@test.com  
パスワード       :test123  
Basic認証 ID   :admin  
Basic認証 PASS :2222  

※ローカルで動作する場合  
git clone https://github.com/ryosuke-toyama/good-question.git

# 作成の背景
前職の経験から、企業がサービスを利用しているお客様より気軽に質問してもらえる音声入力型のチャットアプリを作成いたしました。  
背景として、これまでのコールセンターでの電話対応や、近年導入が進んでいるチャットボットなどではうまく企業とお客様のニーズを解消できないと考えたからです。  
お客様は「直接疑問を声で伝えたい」「人に対応して欲しい」という需要があり、店頭・コールセンター はお客様に「質問内容を早く明確にして欲しい」という需要があります。  
そこで、「音声入力した内容を自動で文章化して、その内容に対して人が対応する」というシステムがあれば解決に近づくのではないかと考えました。チャット形式での応対やチャットボットの導入も増えてきていますが、お客様は「ちょっと聞きたいだけなのにいちいち文章を入力してチャットしたくない」「ボットでは意図した答えにたどり着けない」と、結局店頭やコールセンターに対応を求める場合が多く思います。  
そのため、音声入力で簡単に質問ができ、人間のスタッフから解答が届くチャット機能を実装することにしました。  
さらに日常的に使用するタスク管理アプリの中に組み込むことで、日常生活の中でいつでも簡単に利用してもらえるアプリとなるようにしています。  

# 各機能

* **タスク管理機能**  
  ユーザーは音声入力した内容をタスクにして管理する事が出来ます。  
  タスクを作成するのにキーボードを入力するという手間を省く事で、本当に必要なことに時間を使えます。  
  
  ![audio_visualizer](https://user-images.githubusercontent.com/69573190/100337962-57c96a00-301b-11eb-82d7-f3f04f3933b0.gif)

* **チャット機能**  
  ユーザーは質問や相談をしたいとなった時、他ユーザーとチャットをする事が出来ます。  
  チャットは音声入力で行う事ができるので、質問者は手軽に質問する事が出来ます。文章化されるので相手は内容を声で聞くより早く把握する事が出来、かつ質問の間相手の声に耳を傾けておく必要はありません。  
  
  ![audio_visualizer](https://user-images.githubusercontent.com/69573190/100338063-792a5600-301b-11eb-85dd-ed2c7a91c724.gif)

# 工夫した点
* **全体**  
  キーボード操作に不慣れな層を想定しているので、少し不格好でも主要なボタンは大きく配置しました。  
  
* **タスク管理機能**  
  タスクは実行日時が早い順から表示されるようにし、日付毎にボーダーを表示するようにしました。  
  datetimeのカラムから日付のみを抽出してボーダーを表示させる事に苦労しましたが、strftimeメソッドを使う事により解決しました。  
  
* **チャット機能**  
  よくあるチャットアプリのような形式で双方向非同期に更新されるようにしました。  
  ActionCableを使う事により実装出来ましたが、まだ画像が非同期で更新されず、勉強を進めて改善させる予定です。  

# 開発環境

* Ruby version 6.0.0

* Database creation MySQL

* Deployment instructions Heroku

# テーブル設計

## users テーブル

| Column                | Type       | Options     |
| ----------------------| ---------- | ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| password              | string     | null: false |
| password_confirmation | string     | null: false |
| phone_number          | string     |             |

### Association

- has_many :rooms
- has_many :tasks

## rooms テーブル

| Column           | Type       | Options      |
| ---------------- | ---------- | -------------|
| room_name        | string     | null: false  |

### Association

- has_many :users
- has_many :problems

## room_users テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| room             | references | foreign_key: true |
| user             | references | foreign_key: true |

- belongs_to :room
- belongs_to :user

## problems テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| content          | text       | null: false                    |
| room             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :room

## tasks テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| runtime           | datetime   | null: false , uniqueness: true|
| place             | string     |               uniqueness: true|
| todo              | text       | null: false , uniqueness: true|
| checked           | boolean    | null: false , uniqueness: true|
| user_id           | integer    | null: false , uniqueness: true|

- belongs_to :user
