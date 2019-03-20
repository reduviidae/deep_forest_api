class GameSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :user_games
  has_many :messages
  has_many :users, through: :user_games
  has_one :drawing
end
