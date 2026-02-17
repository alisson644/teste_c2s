class NotificationsController < ApplicationController
  before_action :user_autenticate
  
  def index
    user = Rails.cache.fetch("email")
    notification_service = NotificationServiceApi.new
    event = notification_service.get_notifications(user_mail: user)
    @notifications = JSON.parse(event.body)["event"]
  end
end
