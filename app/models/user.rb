class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :tasks, dependent: :destroy #タスクを複数持つ。ユーザーが削除されたらタスクも同時に削除する。
  
  
  def myTask
    Task.where("user_id = ?", id)
  end
end
