require "httparty"

class WebScrapingServiceApi
  API_BASE = "http://localhost:3001".freeze

  def search_vehicle(url:, user_mail:, task_id:)
    vehicle = { url:, user_mail:, task_id: }
    response = HTTParty.post(
      "#{API_BASE}/api/v1/search_vehicle",
      body: vehicle
    )

    response
  end
end