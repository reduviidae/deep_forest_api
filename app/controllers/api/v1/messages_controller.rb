class Api::V1::MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel',
                                   content:  message.content,
                                   username: message.user.name
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end
end
