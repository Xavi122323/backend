class Api::V1::UserController < ApplicationController

  respond_to :json

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { message: "Logged in successfully!" }
    else
      render json: { message: "Invalid email or password" }, status: :unauthorized
    end
  end

  def register
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'Registration successful' }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
    
  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
  end

  end