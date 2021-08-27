class User < ApplicationRecord
  has_secure_password

  # Validations
  validates :first_name, length: { minimum: 2 }, allow_nil: true, allow_blank: true
  validates :last_name, length: { minimum: 2 }, allow_nil: true, allow_blank: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # Instance method to get full name of user
  def full_name
    [first_name, last_name].compact.reject(&:empty?).join(" ")
  end
end
