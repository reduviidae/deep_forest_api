class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :conversation_id, :user_id
  belongs_to :user
  belongs_to :conversation
end
