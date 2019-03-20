class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find(29)
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
