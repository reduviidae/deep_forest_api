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
    @game = Game.find(message_params[:game_id])
    @message = Message.new(message_params)
    if @message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(@message)
      ).serializable_hash
      puts "serialized_data"
      MessagesChannel.broadcast_to @game, serialized_data
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :game_id, :user_id)
  end
end
