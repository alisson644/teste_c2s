module ApplicationHelper

  def user_signed_in?
    refresh_token = Rails.cache.fetch("refresh_token")
    return true if refresh_token.present?
    false
  end

  def user_signed_out?
    refresh_token = Rails.cache.fetch("refresh_token")
    return false if refresh_token.present?
    true
  end
end
