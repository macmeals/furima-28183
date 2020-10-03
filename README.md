# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------  | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| confirm_pass   | string  | null: false |
| family-name    | string  | null: false |
| first_name     | string  | null: false |
| family-kana    | string  | null: false |
| first-kana     | string  | null: false |
| birth_year     | integer | null: false |
| birth_month    | integer | null: false |
| birth_day      | integer | null: false |

### Association 

- has_many :items

## itemsテーブル

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------  |
| name                | string        | null: false                     |
| image               | binary        | null: false                     |
| price               | integer       | null: false                     |
| item_explaination   | text          | null: false                     |
| category            | string        | null: false                     |
| status              | string        | null: false                     |
| ship_cost           | string        | null: false                     |
| ship_loction        | string        | null: false                     |
| ship_day            | integer       | null: false                     |
| comment             | text          |                                 |
| user_id             | references    | null: false, foreign_key: true  |



### Association 

- belongs_to :user
- has_one :purchased users

### purchased users テーブル

| Column              | Type        | Options                         |
| ------------------  | ----------- | ------------------------------- |
| item-id             | references  | null: false, foreign_key: true  |
| post_code           | integer     | null: false                     |
| prefecture          | string      | null: false                     |
| city                | string      | null: false                     |
| house_address       | string      | null: false                     |
| building            | string      | null: false                     |
| tell_number         | interger    | null: false                     |


### Association 

- belong_to :purchased users