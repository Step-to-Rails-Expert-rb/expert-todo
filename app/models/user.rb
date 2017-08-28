class User < ApplicationRecord
  has_many :tasks, :dependent => :delete_all
  REGISTRABLE_ATTRIBUTES = %i(email name password password_confirmation)

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
