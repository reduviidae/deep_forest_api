class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :game_id, :user_id
  belongs_to :user
  belongs_to :game
end
