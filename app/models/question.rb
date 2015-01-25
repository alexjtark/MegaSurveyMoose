class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  has_many :answers

  validates :content, presence: true

  def how_many_answers
    self.answers.all.count
  end

  def how_many_responses
    self.answers.all.inject(0) {|sum, x| sum + x.how_many_responses}
  end

end
