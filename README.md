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

### Assosiation

- has_many :items
- has_many :purchases
- has_one :shipping



## itemsテーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | text       | null: false                    |
| item_name   | string     | null: flase                    |
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Assosiation

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| shipping    | references | null: false, foreign_key: true |
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
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| apartment   | string     |                                |
| phone       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |


### Assosiation

- belongs_to :user
- belongs_to :purchase
