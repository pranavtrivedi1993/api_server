class Api::V1::UsersController < Api::ApplicationController

  # Get user details
  def show
    @user = current_api_user
  end

  # Update user based on provided parameters
  def update
    @user = current_api_user
    unless @user.update(user_params)
      render json: { error: @user.errors.full_messages.to_sentence }, status: :not_found
    end
  end

  private

  # Strong parameters to permit for user update
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
