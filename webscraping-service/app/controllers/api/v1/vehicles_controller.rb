module Api
  module V1
    class VehiclesController < ApplicationController
         before_action :vehicle_params, only: [:create]
        def index
        end

        def show
        end

        def create
          vehicle = vehicle_params
          VehicleSearchJob.perform_async(vehicle["link"], vehicle["user_id"])
          render json: { status: "SUCCESS", message: "Task create" }, status: :ok
        end

        def update
        end

        def destroy
        end

        private
        def vehicle_params
          params.require(:vehicle).permit(:link, :user_id)
        end
    end
  end
end
