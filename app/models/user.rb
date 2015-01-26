class User < ActiveRecord::Base
  has_secure_password
  has_many :responses, foreign_key: :taker_id

  has_many :created_surveys, foreign_key: :creator_id, class_name: "Survey"

  validates :email, presence: true
  validates :user_name, presence: true

  def which_surveys_answered
    self.responses.all.map {|t| t.which_survey }.uniq {|s| s.id }
  end

end
