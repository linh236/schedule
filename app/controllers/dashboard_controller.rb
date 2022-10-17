class DashboardController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @event = Event.new
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week, user: current_user)
    @selectedDate = params[:selectedDate] if params[:selectedDate].present?
  end
end
