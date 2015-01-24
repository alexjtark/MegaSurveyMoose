get '/survey' do
  # takes user to all surveys

end

get '/survey/new', auth: :user do
  erb :'survey/newSurvey'
end

get '/survey/:id', auth: :user do |id|# take user to particular survey
  @survey = Survey.find(id)
  erb :'survey/_show'
end

put '/survey' do
  survey = Survey.find(params[:survey])
  answers =
  survey

end


post '/survey/new', auth: :user do
  p params
  quiz = parse_question_answers(params)

  params[:survey][:creator_id] = current_user.id
  binding.pry
  survey = Survey.create(params[:survey])

  quiz.each do |entry|
    question = Question.create(content: entry[0])
    entry[1].each do |ans|
      question.answers << Answer.create(content: ans)
    end
    survey.questions << question
  end
  redirect "/survey/#{survey.id}"
end

