class Api::V1::UsersController < ApplicationController

  def index
    @user = User.all()
    render json:@user, status: 200
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.valid_password?(params[:password])
      session[:user_id] = @user.id
      render json: { message: "Logged in successfully!" }
    else
      render json: { message: "Invalid email or password" }, status: :unauthorized
    end
  end

  def new
    @user = User.new
  end

  def register
    @user = User.new(user_params)
    if @user.save
      render json:@cliente, status:200, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
  end

  end