require "httparty"

class WebScrapingManagerApi
  API_BASE = "http://webscraping-manager:8080".freeze

  def update_vehicle(task_id:, price:, model:, brand:, status:, concluded_at:)
    task = { model:, price:, brand:, status:, concluded_at: }

    response = HTTParty.put(
      "#{API_BASE}/tasks/#{task_id}",
      body: task
    )
    puts response
    response
  end
  def send_error_vehicle(task_id:, error_message:, status:)
    task = { error_message:, status: }
    response = HTTParty.put(
      "#{API_BASE}/tasks/#{task_id}",
      body: task
    )

    response
  end

end