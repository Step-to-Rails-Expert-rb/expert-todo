class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :priority
  # enum priority_id: [:S, :A, :B, :C]
  # enum status_id: [:Not_Yet, :Doing, :Done]
end
