class Game < ApplicationRecord
  has_one :conversation
  has_many :user_games
end
