class Api::V1::UserGamesController < ApplicationController
  def index
    @user_games = UserGame.all
    render json: @user_games
  end

  def show
    @user_game = UserGame.find(params[:id])
    render json: @user_game
  end

  def create
    @user_game = UserGame.new(user_game_params)
    if @user_game.save
      render json: @user_game
    end
  end

  private

  def user_game_params
    params.require(:user_game).permit(:game_id, :user_id)
  end
end
