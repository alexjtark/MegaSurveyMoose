class User < ActiveRecord::Base
  has_secure_password
  has_many :responses, foreign_key: :taker_id

  has_many :created_surveys, foreign_key: :creator_id, class_name: "Survey"

  validates :email, presence: true
  validates :user_name, presence: true

  def which_surveys_answered
    self.responses.all.map {|t| t.which_survey }.uniq {|s| s.id }
  end

  def sorted_responses_to_all_surveys
    self.which_surveys_answered.map {|t| t.responses.where(taker_id: self.id)}.map {|s| s.sort_by {|t| t.created_at} }
  end

  def every_individual_survey_taken_by_user
    return self.sorted_responses_to_all_surveys.map {|s| s.group_by{|v| v.created_at.to_i}.values}
  end

end
