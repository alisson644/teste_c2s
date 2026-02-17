class AuthApiCallerController < ApplicationController
  before_action :api_instance
  def create_user
    api_response = @auth_service_api.create_user(user_params)

    if api_response.success?
      current_user(email: params["user"]["email"], access_token: api_response.body["access_token"], refresh_token: api_response.body["refresh_token"] )
      redirect_to root_path
    else
      render registrations_new_path, notice: "API call failed: #{api_response.message}"
    end
  end

  def login
    api_response = @auth_service_api.login(email: params["user"]["email"], password: params["user"]["password"])

    if api_response.success?
      body = JSON.parse(api_response.body)
      current_user(body["access_token"], body["refresh_token"], params["user"]["email"])
      redirect_to root_path
    else
      flash.now[:alert] = "API call failed: #{api_response.body["error"]}"
    end
  end

  def refresh_token

  end
  def get_user

  end
  def logout
    access_token = Rails.cache.fetch("access_token")
    @auth_service_api.logout(access_token)

    logout_user
    redirect_to root_path

  end

  private

  def api_instance
    @auth_service_api = AuthServiceApi.new()
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end