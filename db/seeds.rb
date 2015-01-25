4.times do
  user = User.create(email: Faker::Internet.email, user_name: Faker::Name.name, password: "a")
  3.times do
    survey = Survey.new(title: Faker::Company.bs, creator_id: user.id)
    4.times do
      quest = Question.new(content: Faker::Hacker.say_something_smart)
      6.times do
        ans = Answer.create(content: Faker::Hacker.noun)
        quest.answers << ans
      end
      quest.save
      survey.questions << quest
    end
    survey.save
  end
end

48.times do
  Response.create(answer_id: rand(1..24), taker_id: rand(1..2))
end
