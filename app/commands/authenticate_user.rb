class AuthenticateUser
  prepend SimpleCommand

  # Initialize AuthenticateUser with email and password
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Method to encode id of user
  def call
    JsonWebToken.encode(user_id: api_user.id) if api_user
  end

  private

  attr_accessor :email, :password

  # Private method to find and authenticate user
  def api_user
    user = User.find_by_email(email)
    unless user.present?
      errors.add :message, "Invalid email"
      return nil
    end

    unless user.authenticate(password)
      errors.add :message, "Invalid password"
      return nil
    end

    return user
  end

end
