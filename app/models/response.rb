class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :answer
  belongs_to :taker, class_name: "User"


  def which_survey
    self.answer.question.survey
  end

  def which_question
    self.answer.question
  end

  def survey_creator
    self.answer.question.survey.creator
  end

end
