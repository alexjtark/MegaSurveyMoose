class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :responses

  validates :content, presence: true

  def how_many_responses
    self.responses.count
  end

  def percentage
    raw = self.how_many_responses.to_f / self.question.how_many_responses
    "#{(raw * 100).round(1)}%"
  end


end
