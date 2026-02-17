require "httparty"

class NotificationServiceApi
  API_BASE = "http://localhost:3002".freeze

  def create_notification(user_mail:, task_id:)
    event = { user_mail:, task_id: }
    response = HTTParty.post(
      "#{API_BASE}/api/v1/events",
      body: event
    )
    response
  end

  def get_notifications(user_mail:)
    event = { user_mail: }
    response = HTTParty.get(
      "#{API_BASE}/api/v1/events",
      body: event
    )
    response
  end
end