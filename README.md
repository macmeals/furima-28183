# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| -----------------  | ------   | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| family_name        | string   | null: false |
| first_name         | string   | null: false |
| family_kana        | string   | null: false |
| first_kana         | string   | null: false |
| birth_day          | date     | null: false |

### Association 

- has_many :items
- has_one :sold_item

## itemsテーブル

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------  |
| name                | string        | null: false                     |
| price               | integer       | null: false                     |
| explaination        | text          | null: false                     |
| category_id         | integer       | null: false                     |
| status_id           | integer       | null: false                     |
| ship_cost_id        | integer       | null: false                     |
| ship_loction_id     | integer       | null: false                     |
| ship_day_id         | integer       | null: false                     |
| user_id             | integer       | null: false, foreign_key: true  |

### Association 

- belongs_to :user
- has_many :comments
- has_one :sold_item

## commentsテーブル

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------  |
| comments            | text          |                                 |
| item_id             | integer       | null: false, foreign_key: true  |
| user_id             | integer       | null: false, foreign_key: true  |

### Association 

- belongs_to :item

## addressesテーブル

| Column              | Type        | Options                         |
| ------------------  | ----------- | ------------------------------- |
| post_code           | string      | null: false                     |
| prefecture_id       | integer     | null: false                     |
| city                | string      | null: false                     |
| house_address       | string      | null: false                     |
| building            | string      |                                 |
| tell_number         | string      | null: false                     |
| sold_item_id        | integer     | null: false, foreign_key: true  |

### Association 

- belong_to :sold_item

## sold_itemsテーブル

| Column              | Type        | Options                         |
| ------------------  | ----------- | ------------------------------- |
| user_id             | integer     | null: false, foreign_key: true  |
| item_id             | integer     | null: false, foreign_key: true  |

### Association

- has_one :address
- belong_to :item
- belong_to :user
