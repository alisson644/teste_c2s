class TasksController < ApplicationController
  before_action :set_task, only: %i[ show destroy update ]
  before_action :user_autenticate
  
  def show
  end

  def create
    user = Rails.cache.fetch("email")
    @task = Task.new(task_params)
    @task.user_mail = user

    if @task.save
      web_scraping_api = WebScrapingServiceApi.new
      web_scraping_api.search_vehicle(url: @task.url, user_mail: @task.user_mail, task_id: @task.id)

      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def destroy
      @task.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other, notice: "Task was successfully destroyed." }
    end
  end

  def update
    if @task.update(task_params_api)
      respond_to do |format|
        format.json { render json: @task, status: :ok }
        format.turbo_stream
      end
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params_api
    params.permit(:model, :price, :brand, :error_message, :concluded_at, :status, :id)
  end

  def task_params
    params.require(:task).permit(:title, :url, :model, :price, :brand)
  end
end
