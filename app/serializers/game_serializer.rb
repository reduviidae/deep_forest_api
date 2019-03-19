class GameSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :user_games
end
