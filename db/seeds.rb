2.times {
  User.create(email: Faker::Internet.email, user_name: Faker::Name.name, password: "a")
}

4.times {
  Survey.create(title: Faker::Lorem.sentence, creator_id: rand(1..2))
}

8.times {
  Question.create(content: Faker::Lorem.sentence, survey_id: rand(1..5))
}

16.times {
  Answer.create(answer_content: Faker::Lorem.sentence, question_id: rand(1..10))
}

32.times {
  Response.create(answer_id: rand(1..16), taker_id: rand(1..2))
}
