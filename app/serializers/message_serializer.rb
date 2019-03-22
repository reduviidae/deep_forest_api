class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :game_id, :user_id, :user_name, :created_at
  belongs_to :user
  belongs_to :game
end
