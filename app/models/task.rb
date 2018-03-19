class Task < ApplicationRecord
  belongs_to :user # 一人のユーザーに紐づく。
  validates :content, presence: true
end
