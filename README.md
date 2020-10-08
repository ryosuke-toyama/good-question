# README

# アプリ名
**Good Question**

# 概要
* 音声入力機能を備えたチャット・タスク管理アプリです。
* ユーザーは音声入力機能により他ユーザーに素早く、かつ簡単に質問を投げかける事が出来ます。
* ユーザーは音声入力機能により手早くタスク管理を行う事が出来ます。

# 説明
このアプリには主に以下の3つの機能が備わっています。  
ユーザーは今から自分が行う事を明確化する為にタスクを管理し、タスクを実行する際に疑問点が生じた場合は  
Questionボタンで他ユーザーにチャット形式で質問する事が出来ます。  
これらを同じアプリ内で行う事で、タスクの管理をより質の高いものにします。  
質問に答える義務のあるユーザーは、文章として質問ユーザーの質問内容が確定した順に対応する事が出来ます。

# 作成の背景
　私事ですが、前職で勤めていた携帯ショップで課題がありました。操作の不慣れなお客様の質問に時間がかかるというものです。  
　これにはあらゆる理由があるのですが、その一つが「お客様の質問自体に時間がかかる」というものです。  
　聞きたいことは簡単なことなはずなのに、どう聞けばいいかが分からず色々な情報を伝えて下さいますが、その質問自体に時間がかかってしまうので後に続くお客様の対応が遅れます。  
　これは携帯ショップだけでなく、コールセンター業務などでも起こっていることではないでしょうか？  
　実際コールセンターサービスの不満で１番多いのが「待ち時間が長い」次いで「話し中が多い」「音声応答システムでの番号入力」です。  
　これに対しての対策として、チャット形式での応対やチャットボットの導入も増えてきていますが、お客様は「ちょっと聞きたいだけなのにいちいち文章を入力してチャットしたくない」「ボットでは意図した答えにたどり着けない」と、結局店頭やコールセンターに対応を求める場合が多く思います。  
　お客様は「直接疑問を声で伝えたい」「人に対応して欲しい」という需要があり、店頭・コールセンター は「答えはするが、お客様の質問内容を速く把握したい」という需要があるとすると、「音声入力した内容を自動で文章化して、その内容に対して人が対応する」というシステムがあれば解決に近づくのではないかと考えました。  
更に、質問が文章化されるということは双方にとって「言葉を選ぶ」抑止力が生まれます。  

　解決出来ない問題は「ストレス」を招き、「ストレス」をぶつけやすいのは対人の店頭従事者やコールセンタースタッフです。ぶつけられた「ストレス」は仕事だからと飲み込むしかなく、スタッフ達の心に残ります。実際、コールセンタースタッフや携帯ショップの離職率は慢性的な問題です。  
　このシステムが対人で対応しているスタッフの「ストレス」を少しでも軽減する一助にもなれば幸いです。


* **音声入力機能**  
  ユーザーはチャット投稿・タスク作成時に音声入力ボタンを押す事で、キーボードを使う事なく文字入力をする事ができます。  

* **チャット機能**（現在調整中）  
  ユーザーは質問や相談をしたいとなった時、他ユーザーとチャットをする事が出来ます。  
  チャットは音声入力で行う事ができるので、質問者は手軽に質問する事が出来ます。文章化されるので  
  相手は内容を声で聞くより早く把握する事が出来、かつ質問の間相手の声に耳を傾けておく必要はありません。

* **タスク管理機能**  
  ユーザーは音声入力した内容をタスクにして管理する事が出来ます。  
  タスクを作成するのにキーボードを入力するという手間を省く事で、本当に必要なことに時間を使えます。

# アプリ利用情報
URL : https://good-question-29196.herokuapp.com/

|テスト用アカウント（項目）｜内容          |
|---------------------------|--------------|
|Eメール                    |test@test.com |
|パスワード                 |test123       |
|Basic認証 ID               |admin         |
|Basic認証 PASS             |2222          |

※ローカルで動作する場合  
git clone https://github.com/ryosuke-toyama/good-question.git

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