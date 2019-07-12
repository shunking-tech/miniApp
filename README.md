# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|email|string|null:false|
|pass|string|null:false|
### Association
- has_many :articles

## articleテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null:false|
|user_id|string|null:false|
### Association
- belongs_to :user
