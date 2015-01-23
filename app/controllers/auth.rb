
get '/login' do
  if request.xhr?
    erb :'auth/_login', layout: false
  else
    erb :'auth/_login'
  end
end

post '/login' do
  user = User.find_by(name: params[:user][:user_name])

  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
  redirect '/'
  else
    redirect '/login'
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
 user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    redirect "/signup"
  end
end

get '/user/:id' do
  # shows all surveys created by user

end

get '/signout' do
  session.clear
  redirect '/'
end
