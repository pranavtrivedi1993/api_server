class Api::V1::RegistrationsController < Api::ApplicationController
  skip_before_action :authenticate_request

  # Sign up user based on provided parameters
  def sign_up
    @user = User.new(sign_up_params)
    unless @user.save
      render json: { error: @user.errors.full_messages.to_sentence }, status: :not_found
    end
  end

  private

  # Strong parameters to permit for user sign up
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
