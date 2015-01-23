3.times do
  User.create(email: Faker::Internet.email, user_name: Faker::Name.name, password: "a")
end

6.times do
  Survey.create(title: Faker::Lorem.sentence, creator_id: rand(1..3))
end

12.times do
  Question.create(content: Faker::Lorem.sentence, survey_id: rand(1..6))
end

24.times do
  Answer.create(content: Faker::Lorem.sentence, question_id: rand(1..12))
end

48.times do
  Response.create(answer_id: rand(1..24), taker_id: rand(1..3))
end
