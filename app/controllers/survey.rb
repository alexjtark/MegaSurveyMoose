get '/survey' do
  # takes user to all surveys

end

get '/survey/new', auth: :user do
  erb :'survey/newSurvey'
end

get '/survey/:id', auth: :user do |id|

  # take user to particular survey
  @survey = Survey.find(id)
  erb :'survey/_show'
end

put '/survey' do
  survey = Survey.find(params[:survey])
  answers =
  survey

end


post '/survey/new' do
  p params
  params[:survey][:creator_id => current_user]
  survey = Survey.create(params[:survey])

  question = Question.create(params[:question])
  params[:answer].each do |v|
    question.answers << Answer.create(content: v)
  end
  survey.questions << question
  redirect "/survey/#{survey.id}"
end

