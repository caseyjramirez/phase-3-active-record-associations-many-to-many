puts "🌱 Seeding data..."

25.times do
  User.create( name: Faker::Name.name)
end

# run a loop 50 times
100.times do
  # create a game with random data
  game = Game.create(
    title: Faker::Game.title,
    genre: Faker::Game.genre,
    platform: Faker::Game.platform,
    price: rand(0..60) # random number between 0 and 60
  )

  # create between 1 and 5 reviews for each game
  rand(1..5).times do
    Review.create(
      score: rand(1..10),
      comment: Faker::Lorem.sentence,
      game_id: game.id, 
      user_id: User.all.sample.id
    )
  end
end

puts "🌱 Done seeding!"
