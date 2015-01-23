class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :responses

  validates :answer_content, presence: true

end
