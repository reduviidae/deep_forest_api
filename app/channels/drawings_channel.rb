class DrawingsChannel < ApplicationCable::Channel
  def subscribed
    @game = Game.find(11)
    stream_for @game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
