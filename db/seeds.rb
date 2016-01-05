10.times do
  Note.create(content: Faker::Lorem.sentences(rand(5)).join(' '))
end
