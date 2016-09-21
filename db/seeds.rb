10.times do
  Note.create(content: Faker::Lorem.sentences(rand(5)).join(' '))
end

User.create(email: 'test@example.com', password: '1', password_confirmation: '1',
            confirmed_at: Time.zone.now)