class User < ActiveRecord::Base
  has_secure_password
  has_many :responses, foreign_key: :taker_id

  has_many :created_surveys, foreign_key: :creator_id, class_name: "Survey"

  validates :email, presence: true
  validates :user_name, presence: true

  def answered_surveys
    self.responses.first.answer.question.survey.creator
  end

end
