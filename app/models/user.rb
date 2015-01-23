class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys
  has_many :responses

  validates :email, presence: true
  validates :user_name, presence: true

end
