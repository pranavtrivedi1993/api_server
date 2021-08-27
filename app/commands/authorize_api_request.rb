class AuthorizeApiRequest
  prepend SimpleCommand

  # Initialize AuthorizeApiRequest with headers
  def initialize(headers = {})
    @headers = headers
  end

  # Method to get user
  def call
    api_user
  end

  private

  attr_reader :headers

  # Private method to find user
  def api_user
    @api_user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @api_user || errors.add(:token, "Invalid token") && nil
  end

  # Private method to decode auth token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # Private method to get auth token from headers
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, "Missing token")
    end
    nil
  end
end
