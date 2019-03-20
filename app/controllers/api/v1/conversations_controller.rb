class Api::V1::ConversationsController < ApplicationController

  def index
    conversations = Conversation.all
    render json: conversations
  end

  def show
    conversation = Conversation.first
    render json: conversation
  end

  def create
    conversation = Conversation.new(game_id: Game.first.id)
    if conversation.save
      serialized_data = serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializer_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:game_id)
  end

end
