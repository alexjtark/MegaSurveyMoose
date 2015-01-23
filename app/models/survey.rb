class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :answers, through: :questions
  has_many :responses, through: :answers
  has_many :takers, through: :responses, foreign_key: :taker_id, class_name: "User"

  validates :title, presence: true

end
