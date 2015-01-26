get '/survey' do
  # takes user to all surveys

end

get '/survey/answered/:id' do |id|
  @user = User.find(id)
  erb :'/survey/_taken_surveys_display'
end

get '/survey/new', auth: :user do
  if request.xhr?
    erb :'survey/newSurvey', layout: false
  else
    erb :'survey/newSurvey'
  end
end

get '/survey/:id', auth: :user do |id|# take user to particular survey
  @survey = Survey.find(id)
  erb :'survey/_show'
end

# put '/survey' do
#   survey = Survey.find(params[:survey])
#   answers =
#   survey

# end

post '/survey/answer', auth: :user do
  p params
  user_id = params[:taker]
  params[:question].each do |q,a|
    Response.create(taker_id: user_id, answer_id: a)
  end

  redirect '/'
end

post '/survey/new', auth: :user do

  quiz = parse_question_answers(params)
  params[:survey][:creator_id] = current_user.id
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

