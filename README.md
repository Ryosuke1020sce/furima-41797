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
| birthday_year      | integer | null: false |
| birthday_month     | integer | null: false |
| birthday_day       | integer | null: false |

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| explain       | text       | null: false |
| category      | string     | null: false |
| condition     | string     | null: false |
| delivery_fee  | string     | null: false |
| delivery_area | string     | null: false |
| delivery_days | string     | null: false |
| price         | string     | null: false |
| user_id       | references | null: false, foreign_key: true |

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

## deliverys テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| prefecture | string     | null: false |
| city       | string     | null: false |
| address    | string     | null: false |
| building   | string     | null: false |
| tel        | string     | null: false |
| post_code  | string     | null: false |
| buy_id     | references | null: false, foreign_key: true |
