class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :answers, through: :questions
  has_many :responses, through: :answers

  validates :title, presence: true

end
