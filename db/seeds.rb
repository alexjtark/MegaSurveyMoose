2.times do
  user = User.create(email: Faker::Internet.email, user_name: Faker::Name.name, password: "a")
  2.times do
    survey = Survey.new(title: Faker::Lorem.sentence, creator_id: user.id)
    4.times do
      quest = Question.new(content: Faker::Lorem.sentence)
      8.times do
        ans = Answer.create(content: Faker::Lorem.sentence)
        quest.answers << ans
      end
      quest.save
      survey.questions << quest
    end
    survey.save
  end
end

48.times do
  Response.create(answer_id: rand(1..24), taker_id: rand(1..3))
end
