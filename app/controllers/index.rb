get '/' do
  # landing page
  @survey = Survey.all
  erb :index
end
