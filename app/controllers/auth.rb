
get '/login' do
  if request.xhr?
    erb :'auth/_login', layout: false
  else
    erb :'auth/_login'
  end
end

post '/login' do
  user = User.find_by(user_name: params[:user][:user_name])

  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
  redirect '/'
  else
    redirect '/'
  end
end

get '/signup' do
  if request.xhr?
    erb :'auth/_signup', layout: false
  else
    erb :'auth/_signup'
  end

end
post '/signup' do
 user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    parse_ar_errors_for_display!(user.errors)
    redirect "/"
  end
end

get '/user/:id' do |id|
  @survey = Survey.where(creator_id: id)
  erb :index
  # shows all surveys created by user
end

get '/logout' do
  session.clear
  redirect '/'
end
