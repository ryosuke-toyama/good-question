# README

* Ruby version 6.0.0

* Database creation MySQL

* Deployment instructions Heroku

* # テーブル設計

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