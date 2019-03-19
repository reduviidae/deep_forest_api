class UserGameSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :user_id
  belongs_to :game
  belongs_to :user
end
