class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :pronouns
  has_many :user_games
  has_many :messages
end
