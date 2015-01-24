def parse_question_answers(params)
  survey = []
  params.each do |k,v|
    unless k == 'survey'
      question = v.shift
      answers = v
      survey << [question, answers]
    end
  end
  return survey
end