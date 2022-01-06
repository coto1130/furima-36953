## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
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
- has_one :shipping



## itemsテーブル

| Colum                | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: flase                    |
| item_description     | text       | null: false                    |
| item_categoty        | string     | null: false                    |
| item_status          | string     | null: false                    |
| item_shipping_fee    | string     | null: false                    |
| item_prefecture      | string     | null: false                    |
| item_shipping_date   | string     | null: false                    |
| item_price           | string     | null: false                    |
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

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postalcode  | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| apartment   | string     |                                |
| phone       | string     | null: false                    |
| purchase    | references | null: false, foreign_key: true |



### Assosiation

- belongs_to :user
- belongs_to :purchase
