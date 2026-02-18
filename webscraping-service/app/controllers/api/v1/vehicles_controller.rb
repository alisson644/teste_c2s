module Api
  module V1
    class VehiclesController < ApplicationController
      def index
      end

      def show
      end

      def create
        scraper_manager_api = WebScrapingManagerApi.new
        notification_service_api = NotificationServiceApi.new


        search_vehicle = Vehicle.where(url: url_convert).first
        if search_vehicle.present?
          scraper_manager_api.update_vehicle(task_id: params["task_id"], price:"",  model:"", brand:"" , status: "in_progress" , concluded_at: "")
          notification_service_api.create_notification(user_mail: params["user_mail"], task_id: params["task_id"], type_event: "task_created", model: "", brand: "", price: "", error_message:"")
          notification_service_api.create_notification(user_mail: params["user_mail"], task_id: params["task_id"], type_event: "task_completed", model:search_vehicle.model, brand: search_vehicle.brand, price: search_vehicle.price, error_message:"")
          scraper_manager_api.update_vehicle(task_id: params["task_id"], price: search_vehicle.price, model: search_vehicle.model, brand: search_vehicle.brand, status: "completed" , concluded_at: Time.now)
          render json: { status: "SUCCESS", message: "Task create" }, status: :ok
        else
          VehicleSearchJob.perform_async(url_convert, params["user_mail"], params["task_id"])
          render json: { status: "Pending", message: "Task create" }, status: :ok
        end
      end

      def update
      end

      def destroy
      end

      private

      def url_convert
        return params["url"][/.*?(?=\?)/] if params["url"].match?(/.*?(?=\?)/)
        params["url"]
      end
    end
  end
end
