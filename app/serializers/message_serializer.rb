class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :game_id, :user_id, :created_at
  belongs_to :user
  belongs_to :game
end
