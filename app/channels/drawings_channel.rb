class DrawingsChannel < ApplicationCable::Channel
  def subscribed
    @drawing = Drawing.find_by(game_id: params[:game_id])
    stream_for @drawing
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
