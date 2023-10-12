class Api::V1::SessionsController < Devise::SessionsController

    def create
      user = User.find_by_email(sign_in_params[:email])
  
      if user && user.valid_password?(sign_in_params[:password])
        token = user.generate_jwt
        render json: token.to_json
      else
        render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
      end
    end

    def index
        @user = User.all()
        render json:@user, status: 200
    end
  
end