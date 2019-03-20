class GameSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :user_games
  has_one :conversation
  has_many :messages, through: :conversation
  has_many :users, through: :user_games
end
