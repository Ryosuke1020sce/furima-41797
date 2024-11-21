# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

## Association

- has_many :items
- has_many :buys

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| explain       | text       | null: false |
| category_id   | integer    | null: false |
| condition_id  | integer    | null: false |
| delivery_fee_id  | integer | null: false |
| prefecture_id    | integer | null: false |
| delivery_day_id  | integer | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## Association

- belongs_to :item
- belongs_to :user
- has_one :delivery

## deliverys テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| prefecture_id | integer | null: false |
| city       | string     | null: false |
| address    | string     | null: false |
| building   | string     |             |
| tel        | string     | null: false |
| post_code  | string     | null: false |
| buy        | references | null: false, foreign_key: true |

## Association

- belongs_to :buy
