1.times do
  User.create(email: Faker::Internet.email, user_name: Faker::Name.name, password: "a")
end

2.times do
  Survey.create(title: Faker::Lorem.sentence, creator_id: rand(1..2))
end

4.times do
  Question.create(content: Faker::Lorem.sentence, survey_id: rand(1..2))
end

8.times do
  Answer.create(content: Faker::Lorem.sentence, question_id: rand(1..4))
end

16.times do
  Response.create(answer_id: rand(1..16), taker_id: rand(1..2))
end
