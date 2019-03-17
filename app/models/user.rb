class User < ApplicationRecord
  has_secure_password
  has_many :user_games
  has_many :messages
  validates :name, uniqueness: { case_sensitive: false }
end
