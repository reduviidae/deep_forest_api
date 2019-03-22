class DrawingsChannel < ApplicationCable::Channel
  def subscribed
    @game = Game.find(params[:game_id])
    stream_for @game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
