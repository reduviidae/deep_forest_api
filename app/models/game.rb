class Game < ApplicationRecord
  has_one :drawing
  has_many :messages
  has_many :user_games
  has_many :users, through: :user_games
end
