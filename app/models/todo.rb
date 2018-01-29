# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  deadlien   :date
#  done       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Todo < ApplicationRecord
  belongs_to :user
end
