class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  protect_from_forgery unless: -> { request.format.json? }

  allow_browser versions: :modern

  def current_user(access_token, refresh_token, email)
  Rails.cache.write("access_token", access_token)
  Rails.cache.write("refresh_token", refresh_token)
  Rails.cache.write("email", email)
  end

  def logout_user
    Rails.cache.delete("email")
    Rails.cache.delete("refresh_token")
    Rails.cache.delete("access_token")
  end
  
  def user_autenticate
    access_token = Rails.cache.fetch("access_token")
    return if access_token.present?
    redirect_to root_path
  end
end
