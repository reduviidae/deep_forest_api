class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render :json => @users, each_serializer: UserSerializer
  end

  def create
    @user = User.create(user_params)
    @user.avatar = "pink_fairy_armadillo"
    @user.save
    if @user.valid?
      UserGame.create(user_id: @user.id, game_id: 1)
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: `failed to create user` }, status: :not_acceptable
    end
  end

  def reauth
    puts "#{params}"
    puts "#{user_params}"
  end

  def update
    @user = User.find(params[:id])
    if user_params[:pronouns]
     @user.pronouns = user_params[:pronouns]
     @user.save
    end
    if user_params[:avatar]
      @user.avatar = user_params[:avatar]
      @user.save
    end
    render :json => @user, each_serializer: UserSerializer
  end

  def show
    @user = User.find(params[:id])
    render :json => @user, each_serializer: UserSerializer
  end

  def profile
    @user = User.find(params[:id])
    render :json => @user, each_serializer: UserSerializer
  end

  private
  def user_params
      params.require(:user).permit(:name, :pronouns, :password, :avatar)
  end

end
