get '/survey' do
  # takes user to all surveys
end

get '/survey/:id', auth: :user do
  # take user to particular survey

end
