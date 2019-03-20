class Game < ApplicationRecord
  has_one :conversation
  has_many :user_games
  has_many :users, through: :user_games
  has_many :messages, through: :conversation
end
