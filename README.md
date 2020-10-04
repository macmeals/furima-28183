# テーブル設計

## users テーブル

| Column         | Type     | Options     |
| -------------- | ------   | ----------- |
| nickname       | string   | null: false |
| email          | string   | null: false |
| password       | string   | null: false |
| confirm_pass   | string   | null: false |
| family_name    | string   | null: false |
| first_name     | string   | null: false |
| family_kana    | string   | null: false |
| first_kana     | string   | null: false |
| birth_day      | date     | null: false |

### Association 

- has_many :items

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
| comment             | text          |                                 |
| user_id             | integer       | null: false, foreign_key: true  |
| buyer_id            | integer       | null: false, foreign_key: true  |

### Association 

- belongs_to :user
- has_one :buyer


## buyers（購入者） テーブル

| Column              | Type        | Options                         |
| ------------------  | ----------- | ------------------------------- |
| post_code           | string      | null: false                     |
| prefecture_id       | integer     | null: false                     |
| city                | string      | null: false                     |
| house_address       | string      | null: false                     |
| building            | string      |                                 |
| tell_number         | string      | null: false                     |
| item_id             | integer     | null: false, foreign_key: true  |

### Association 

- belong_to : item