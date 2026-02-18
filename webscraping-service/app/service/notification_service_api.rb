require "httparty"

class NotificationServiceApi
  API_BASE = "http://notification-service:3002".freeze

  def create_notification(user_mail:, task_id:, type_event:, model:, brand:, price:, error_message:)
    event = { user_mail:, task_id:, type_event:, model:, brand:, price:, error_message: }
    response = HTTParty.post(
      "#{API_BASE}/api/v1/events",
      body: event
    )
    response
  end

end