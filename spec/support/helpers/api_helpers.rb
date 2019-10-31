module ApiHelpers
  def json
    JSON.parse response.body
  end

  def response_data
    json['data']
  end

  def auth_headers(user)
    auth_token = Knock::AuthToken.new payload: { sub: user.id }
    {
      Authorization: "Bearer #{auth_token.token}",
      format: :json
    }
  end
end