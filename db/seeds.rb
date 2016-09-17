10.times do
  Note.create(content: Faker::Lorem.sentences(rand(5)).join(' '))
end

User.create(email: 'your.email@example.com', password: 'yourpassword', password_confirmation: 'yourpassword',
            confirmed_at: Time.zone.now)