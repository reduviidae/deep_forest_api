class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users, each_serializer: UserSerializer
  end

  def create
    @user = User.create(user_params)
    p @user.errors
    render :json => @user, each_serializer: UserSerializer
  end

  def show
    @user = User.find(params[:id])
    render :json => @user, each_serializer: UserSerializer
  end

  private
  def user_params
      params.require(:user).permit(:name, :pronouns)
  end

end
