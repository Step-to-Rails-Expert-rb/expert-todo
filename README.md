
## users
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :tasks
- has_many :tasks, through: :members

## todos
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, add_index|
|detail|text|null: false, add_index|
|user_id|integer|null: false, foreign_key: true|
|deadline|datetime|null: false|
|priority|integer|null: false, enum|
|status|integer|null_false, enum|

###Association
- belongs_to :user
- has_many :users, throgh: :members


## members
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|task_id|integer|null: false, foreign_key: true|
|each_status|integer||

###Association
- belongs_to :user
- belongs_to :task