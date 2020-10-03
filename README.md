# テーブル設計

## users テーブル

| Column         | Type     | Options     |
| -------------- | ------   | ----------- |
| nickname       | string   | null: false |
| email          | string   | null: false |
| password       | string   | null: false |
| confirm_pass   | string   | null: false |
| family-name    | string   | null: false |
| first_name     | string   | null: false |
| family-kana    | string   | null: false |
| first-kana     | string   | null: false |
| birth_day      | datetime | null: false |

### Association 

- has_many :items

## itemsテーブル

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------  |
| name                | string        | null: false                     |
| price               | integer       | null: false                     |
| item_explaination   | text          | null: false                     |
| category            | integer       | null: false                     |
| status              | integer       | null: false                     |
| ship_cost           | integer       | null: false                     |
| ship_loction        | integer       | null: false                     |
| ship_day            | integer       | null: false                     |
| comment             | text          |                                 |

### Association 

- belongs_to :user
- has_many :buy_users_items
- has_many :buy_users , through: :buy_users_items

## buy_users_itemsテーブル

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------  |
| item_id             | integer       | null: false , foreign_key: true |
| buy_user_id         | integer       | null: false , foreign_key: true |

### Association 

- belongs_to : item
- belongs_to : buy_user

### buy_users テーブル

| Column              | Type        | Options                         |
| ------------------  | ----------- | ------------------------------- |
| post_code           | string      | null: false                     |
| prefecture          | integer     | null: false                     |
| city                | string      | null: false                     |
| house_address       | string      | null: false                     |
| building            | string      |                                 |
| tell_number         | string      | null: false                     |

### Association 

- has_many :buy_users_items
- has_many :items , through: :buy_users_items