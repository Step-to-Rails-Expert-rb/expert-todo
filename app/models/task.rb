class Task < ApplicationRecord
  after_initialize :init , if: :new_record?

  belongs_to :user
  belongs_to :project

  module STATE
    INIT = 1
    PROCESSING = 2
    COMPLETE = 3
  end

  validates :user_id, presence: true
  validates :title, presence: true
  validates :start_on, presence: true
  validates :end_on, presence: true
  validates :state, presence: true

  def init
    self.state = STATE::INIT
  end

  def state_name
    case self.state
      when STATE::INIT
        '未着手'
      when STATE::PROCESSING
        '仕掛り中'
      when STATE::COMPLETE
        '完了'
    end
  end
end