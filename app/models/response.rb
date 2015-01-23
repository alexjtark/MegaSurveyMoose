class Response < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  has_many :takers, class_name: "User"

end
