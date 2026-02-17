class HomeController < ApplicationController
  def index
    user = Rails.cache.fetch("email")
    @tasks = Task.where(user_mail: user).order(created_at: :asc) if user.present?

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream
    end
  end
end
