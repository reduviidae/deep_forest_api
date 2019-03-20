class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.all
    render json: @games
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def create
    game = Game.new(game_params)
    if game.save
      serialized_data = serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(game)
      ).serializer_hash
      ActionCable.server.broadcast 'games_channel', serialized_data
      head :ok
    end
  end

  private

  def game_params
    params.require(:games).permit(:game_id, :title)
  end
end
