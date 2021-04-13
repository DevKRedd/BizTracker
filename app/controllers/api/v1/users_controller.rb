class Api::V1::UsersController < ApplicationController
    # How can a user create an account if our app asks them to be logged in or authorized to do so? Skipping the before action 'unlocks' this portion of our app.
    skip_before_action :authorized, only: [:create]

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
  
    def create
      @user = User.create!(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
  
    private
      def user_params
        params.require(:user).permit(:email, :password, :bio, :avatar, :first_name, :last_name, :company_name, :active_charts)
      end
end

