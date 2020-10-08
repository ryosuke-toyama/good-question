# README

# アプリ名
<span style="font-size: 250%;">**Good Question**</span>

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

* **音声入力機能**  
  ユーザーはチャット投稿・タスク作成時に音声入力ボタンを押す事で、キーボードを使う事なく文字入力をする事ができます。  

* **チャット機能**  
  ユーザーは質問や相談をしたいとなった時、他ユーザーとチャットをする事が出来ます。  
  チャットは音声入力で行う事ができるので、質問者は手軽に質問する事が出来ます。文章化されるので  
  相手は内容を声で聞くより早く把握する事が出来、かつ質問の間相手の声に耳を傾けておく必要はありません。

* **タスク管理機能**  
  ユーザーは音声入力した内容をタスクにして管理する事が出来ます。  
  タスクを作成するのにキーボードを入力するという手間を省く事で、本当に必要なことに時間を使えます。

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