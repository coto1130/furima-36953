## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false,              |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| lastname           | string | null: false               |
| firstname          | string | null: false               |
| lastname_kana      | string | null: false               |
| firstname_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Assosiation

- has_many :items
- has_many :purchases



## itemsテーブル

| Colum                | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: flase                    |
| item_description     | text       | null: false                    |
| category_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| shipping_fee_id      | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| shipping_date_id     | integer    | null: false                    |
| item_price           | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル

| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postalcode     | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| apartment      | string     |                                |
| phone          | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |



### Assosiation

- belongs_to :purchase
