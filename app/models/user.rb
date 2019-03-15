class User < ApplicationRecord
  has_secure_password
  has_many :user_games
  validates :name, uniqueness: { case_sensitive: false }
end
