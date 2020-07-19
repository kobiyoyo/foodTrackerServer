class Auth
  def authenticated_header(users)
    token = Knock::AuthToken.new(payload: { sub: users.id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end
  def token(users)
  	 Knock::AuthToken.new(payload: { sub: users.id }).token
  end
end
