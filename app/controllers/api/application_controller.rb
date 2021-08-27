class Api::ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_api_user

  private

  # Private method to authenticate request
  def authenticate_request
    @current_api_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: "This is not a authorized request." }, status: :unauthorized unless @current_api_user
  end
end
