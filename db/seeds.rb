# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Game.destroy_all
UserGame.destroy_all
Conversation.destroy_all
Message.destroy_all

15.times do
  User.create({name: Faker::GreekPhilosophers.name, pronouns: ["he/him", "she/her", "they/them"].sample, password:'dog'})
end

5.times do
  Game.create({title: Faker::BossaNova.song})
end

User.all.each do |user|
  UserGame.create({user_id: user.id, game_id: Game.all.sample.id})
end

Game.all.each do |game|
  Conversation.create({game_id: game.id})
end

Conversation.all.each do |conversation|
  10.times do
    Message.create({content: Faker::Hacker.say_something_smart, conversation_id: conversation.id, user_id: User.all.sample.id})
  end
end
