# frozen_string_literal: true

class Auth
  def authenticated_header(users)
    token = Knock::AuthToken.new(payload: { sub: users.id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end
end
