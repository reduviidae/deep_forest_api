class DrawingsChannel < ApplicationCable::Channel
  def subscribed
    @drawing = Drawing.find(params[:id])
    stream_for @drawing
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
