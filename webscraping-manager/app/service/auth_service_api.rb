require "httparty"

class AuthServiceApi
  API_BASE = "http://auth-service:3000".freeze

  def create_user(user)
    users = { user: }
    response = HTTParty.post(
      "#{API_BASE}/api/v1/users",
      body: users
    )

    response
  end

  def login(email:, password:)
    user = { email:, password: }
    response = HTTParty.post(
      "#{API_BASE}/api/v1/login",
      body: user

    )

    response
  end

  def refresh_token(refresh_token)
    refresh_token = { refresh_token: }
    response = HTTParty.post(
      "#{API_BASE}/api/v1/refresh_token",
      body: refresh_token

    )

  response
  end

  def get_user(authorization, user_id)
    response = HTTParty.get(
      "#{API_BASE}/api/v1/users/#{user_id}",
      headers: {
        "Authorization" => authorization,
        "Content-Type" => "application/json"
      },
    )

    response
  end

  def logout(authorization)
    response = HTTParty.delete(
      "#{API_BASE}/api/v1/logout",
      headers: {
        "Authorization" => authorization,
        "Content-Type" => "application/json"
      },
    )
    response
  end
end