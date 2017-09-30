class Task < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :task_name, presence: true
end
