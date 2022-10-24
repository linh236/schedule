class DashboardController < ApplicationController
  skip_before_action :authenticate_user!
  DATETIME = DateTime.now

  def index
    @event = Event.new
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week, user: current_user)
    @selectedDate = params[:selectedDate] if params[:selectedDate].present?
    if user_signed_in?
      @attendance  = AttendanceLog.find_by(user_id: current_user.id, date: DATETIME.to_date)
    end
  end
end
