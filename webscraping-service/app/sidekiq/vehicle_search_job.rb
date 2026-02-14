class VehicleSearchJob
  include Sidekiq::Job

  def perform(link, user_id)
    api_key    = ENV.fetch("BRIGTH_DATA_KEY")
    dataset_id = ENV.fetch("BRIGHT_DATA_WEBMOTORS_DATASET_ID")

    scraper = WebmotorsScraper.new(api_key: api_key, dataset_id: dataset_id)

    urls = [
      link
    ]

    trigger_res = scraper.trigger(urls)
    snapshot_id = trigger_res["snapshot_id"]


    results = scraper.fetch_results(snapshot_id)

    Vehicle.create(get_data(results[0], link, user_id))

  end

  def get_data(results, link, user_id)
    {
      link:,
      user_id:,
      model: results["Modelo"],
      brand: results["Marca"],
      price: results["price"]
    }
  end
end

