class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :pronouns, :avatar
  has_many :user_games
  has_many :messages
  has_many :games, through: :user_games
end
