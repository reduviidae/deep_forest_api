class MessagesChannel < ApplicationCable::Channel
  def subscribed
    @game = Game.find(params[:game])
    @conversation = Conversation.find(@game.id)
    stream_for @conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
