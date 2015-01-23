

get '/login' do


end

get '/signup' do

end

get '/user/:id' do
  # shows all surveys created by user

end

get '/signout' do
  session.clear
  redirect '/'
end
