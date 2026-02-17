require "httparty"
require "json"

class WebmotorsScraper
  API_BASE = "https://api.brightdata.com/datasets/v3".freeze

  def initialize(api_key:, dataset_id:)
    @api_key = api_key
    @dataset_id = dataset_id
  end


  def trigger(urls)
    response = HTTParty.post(
      "#{API_BASE}/trigger",
      query: { dataset_id: @dataset_id, format: "json" },
      headers: {
        "Authorization" => "Bearer #{@api_key}",
        "Content-Type" => "application/json"
      },
      body: urls.map { |u| { url: u } }.to_json
    )

    raise "Trigger error: #{response.code} - #{response.body}" unless response.success?

    JSON.parse(response.body)
  end


  def fetch_results(snapshot_id, interval: 30, max_attempts: 30)
    attempts = 0

    loop do
      response = HTTParty.get(
        "#{API_BASE}/snapshot/#{snapshot_id}",
        headers: {
          "Authorization" => "Bearer #{@api_key}"
        }
      )

      return response unless response.success?

      data = JSON.parse(response.body)
      status = data["status"]
      case status
      when "ready"
        return download_results(snapshot_id)
      when "failed"
        return response
      else
        return download_results(snapshot_id) if data["id"].present?
        return response if data["timestamp"].present?
        attempts += 1
        return response if attempts >= max_attempts

        sleep interval
      end
    end
  end

  def download_results(snapshot_id)
    response = HTTParty.get(
      "#{API_BASE}/snapshot/#{snapshot_id}",
      query: { format: "json" },
      headers: {
        "Authorization" => "Bearer #{@api_key}"
      }
    )

    response
  end
end