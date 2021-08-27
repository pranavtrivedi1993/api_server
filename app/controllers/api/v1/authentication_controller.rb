class Api::V1::AuthenticationController < Api::ApplicationController
  skip_before_action :authenticate_request

  # Authenticate user based on email and password
  def authenticate
    command = AuthenticateUser.call(params[:email].to_s.strip.downcase, params[:password])
    if command.success?
      @auth_token = command.result
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
