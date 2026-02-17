module Api
  module V1
    class EventsController < ApplicationController
      def index
        events = Event.where(user_mail: params[:user_mail])
        render json: { event: events }, status: :ok
      end
    
      def create
        event = Event.new(event_params)
        if event.save
          render json: { event: event }, status: :created
        end
      end
    
      def destroy
        event = Event.where(id: params[:id]).first
        if event.present? && event.destroy
          render json: { event: "deteled" }, status: :ok
        else
          render json: { event: "evento não existe" }, status: :not_found
        end
      end
    
      private
    
    
      def event_params
         params.permit(:task_id, :type_event, :user_mail, :price, :brand, :model, :error_message)
      end
    end
  end
end

