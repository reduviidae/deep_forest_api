# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
# Game.destroy_all
UserGame.destroy_all
Message.destroy_all
Drawing.destroy_all
#
15.times do
  User.create({name: Faker::GreekPhilosophers.name, pronouns: ["he/him", "she/her", "they/them"].sample, password:'dog'})
end

# game = Game.create({title: "Chat and Draw"})


User.all.each do |user|
  UserGame.create({user_id: user.id, user_name: user.name, game_id: game.id})
end

UserGame.all.each do |ug|
  5.times do
    Message.create({user_id: ug.user_id, user_name: ug.user_name, game_id: ug.game_id, content: Faker::GreekPhilosophers.quote})
  end
end

Drawing.create({game_id: game.id, color: "#1b1b1b", lineWidth: 5, draw: false,
  plots:[]})

User.all.each do |user|
  user.avatar = ["pink_fairy_armadillo", "okapi", "glaucus_atlanticus", "maned_wolf", "fossa"].sample
  user.save
end
