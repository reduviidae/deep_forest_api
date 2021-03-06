class User < ApplicationRecord
  has_secure_password
  has_many :user_games
  has_many :messages
  has_many :games, through: :user_games
  validates :name, uniqueness: { case_sensitive: false }
end
