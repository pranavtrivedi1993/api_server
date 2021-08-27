class JsonWebToken
  class << self
    # Class method to encode payload
    def encode(payload, expiry = 24.hours.from_now)
      payload[:expiry] = expiry.to_i
      secret_key_base = Rails.application.secrets.secret_key_base
      JWT.encode(payload, secret_key_base, 'HS256')
    rescue
      nil
    end

    # Class method to decode token
    def decode(token)
      secret_key_base = Rails.application.secrets.secret_key_base
      body = JWT.decode(token, secret_key_base, true, { algorithm: 'HS256' })[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
