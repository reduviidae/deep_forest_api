class Api::V1::MessagesController < ApplicationController

  def index
    @messages = Message.all
    render json: @messages
  end

  def show
    @message = message.find(params[:id])
    render json: @message
  end

  def create
    @message = Message.new(message_params)
    @game = Game.find(message_params[:game_id])
    if @message.save
      ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(@message)
      ).serializable_hash
      MessagesChannel.broadcast_to @game, serialized_data
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :game_id, :user_id)
  end
end
