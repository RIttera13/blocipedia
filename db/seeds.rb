100.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Internet.password
  )
end

users = User.all

20.times do
  Wiki.create!(
    title: Faker::StarWars.character,
    body: Faker::ChuckNorris.fact
  )
end
topics = Wiki.all

admin = User.create!(
  email:    'admin@b.com',
  password: 'helloworld',
  role:     'admin'
)

premium = User.create!(
  email:    'premium@b.com',
  password: 'helloworld',
  role:     'premium'
)

standard = User.create!(
  email:    'standard@b.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
