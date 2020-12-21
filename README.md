# テーブル設計

## Usersテーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| birthday   | integer | null: false |

### Association

- has_many :products
- has_many :orders

## Productsテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| name              | string     | null: false |
| description       | text       | null: false |
| category          | integer    | null: false |
| product_condition | integer    | null: false |
| shipping charges  | integer    | null: false |
| prefecture        | integer    | null: false |
| shipping days     | integer    | null: false |
| user_id(buyer)    | preference | null: false |
| price             | integer    | null: false |


### Association

- belongs_to :user
- has_one :order

## Ordersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | preference | null: false, foreign_key: true |
| product_id | preference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## Addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone_number  | integer    | null: false |
| orders_id     | preference |             |

### Association

- belongs_to :order