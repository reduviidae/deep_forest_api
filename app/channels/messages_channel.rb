class MessagesChannel < ApplicationCable::Channel
  def subscribed
    @game = Game.find_by(user_id: 96)
    stream_for @game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
