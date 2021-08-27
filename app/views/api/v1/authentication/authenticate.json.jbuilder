json.user do
  if @auth_token.present?
    json.auth_token @auth_token
  end
end
