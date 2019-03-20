class MessagesChannel < ApplicationCable::Channel
  def subscribed
    @conversation = Conversation.find_by(user_id: 96)
    stream_for @conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
