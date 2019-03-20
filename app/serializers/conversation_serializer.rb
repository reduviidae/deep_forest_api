class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :game_id
  has_many :messages
end
