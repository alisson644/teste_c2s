class VehicleSearchJob
  include Sidekiq::Job

  def perform(url, user_mail, task_id)
    api_key    = ENV.fetch("BRIGTH_DATA_KEY")
    dataset_id = ENV.fetch("BRIGHT_DATA_WEBMOTORS_DATASET_ID")

    scraper = WebmotorsScraper.new(api_key: api_key, dataset_id: dataset_id)
    notification_service_api = NotificationServiceApi.new
    scraper_manager_api = WebScrapingManagerApi.new
    notification_service_api.create_notification(user_mail:, task_id:, type_event: "task_created", model: "", brand: "", price: "", error_message: "")

    urls = [
      url
    ]

    trigger_res = scraper.trigger(urls)
    snapshot_id = trigger_res["snapshot_id"]

    results = scraper.fetch_results(snapshot_id)


    if results.success?
      if results.count > 1
        notification_service_api.create_notification(user_mail:, task_id:, type_event: "task_failed", model: "", brand: "", price: "", error_message: "Veiculo nao encotrado")
        scraper_manager_api.send_error_vehicle(error_message: "Veiculo nao encotrado", task_id:, status: "failed")
      else
        Vehicle.create(get_data(results[0], url, user_mail, task_id))
        notification_service_api.create_notification(user_mail:, task_id: , type_event: "task_completed", model: results[0]["Modelo"], brand: results[0]["Marca"], price: results[0]["price"], error_message:"")
        scraper_manager_api.update_vehicle(task_id:, price: results[0]["price"], model: results[0]["Modelo"], brand: results[0]["Marca"], status: "completed", concluded_at: Time.now)
      end
    else
     notification_service_api.create_notification(user_mail: , task_id: , type_event: "task_failed", model: "", brand: "", price: "", error_message:"Veiculo nao encotrado")
     scraper_manager_api.send_error_vehicle(error_message: "Veiculo nao encotrado", task_id:, status: "failed")
    end

  end
  def update_vehicle_data(results, task_id)
    {
      task_id:,
      model: results["Modelo"],
      brand: results["Marca"],
      price: results["price"]
  }
  end

  def get_data(results, url, user_mail, task_id)
    {
      url:,
      user_mail:,
      task_id:,
      model: results["Modelo"],
      brand: results["Marca"],
      price: results["price"],
    }
  end
end