class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  has_many :answers

  validates :content, presence: true

  def how_many_answers
    self.answers.all.count
  end

  def responses_from_user(user)
    self.answers.map {|a| a.responses.where(taker_id: user)}.flatten.map {|r| r.answer}
  end

  def how_many_responses
    self.answers.all.inject(0) {|sum, x| sum + x.how_many_responses}
  end

  def sorted_answers
    self.answers.sort_by {|a| 1 / a.percentage.to_f}
  end

end
