class Api::V1::UserController < ApplicationController

    def create
      user = User.find_by(email: params[:username])
  
      if user&.valid_password?(params[:password])
        token = generate_token_for(user)
        render json: { token: token }
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    private
    def generate_token_for(user)
      # Using the 'jwt' gem to generate a token
      payload = {
        user_id: user.id,
        exp: 1.day.from_now.to_i # Token expiration time
      }
  
      secret_key = Rails.application.secret_key_base
      JWT.encode(payload, secret_key, 'HS256')
    end

  end