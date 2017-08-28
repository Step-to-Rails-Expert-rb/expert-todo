class Task < ApplicationRecord
  belongs_to :user
  REGISTRABLE_ATTRIBUTES = %i(user_id title detail priority status
                              scheduled_start_at scheduled_end_at)

  validates :user_id, presence: true
  validates :title, presence: true
  validates :detail, presence: true
  validates :priority, presence: true
  validates :status, presence: true

end
