get '/survey' do
  # takes user to all surveys
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

