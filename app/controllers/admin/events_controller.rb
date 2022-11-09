class Admin::EventsController < AdminController
  before_action :set_params, only: %i[update]
  def index
  end

  def update
    if params[:date].present?
      @event.update(start_time: params[:date], end_time: params[:date])
      get_event_in_month
    else 
      render_toast('Error', 'You select date before move event!', 'error')
    end
  end

  def update_date
    @events = Event.where(start_time: params[:from], user_id: current_user.id)
    if @events.present?
      @events.update_all(start_time: params[:to], end_time: params[:to])
    end
    get_event_in_month
  end

  private 

    def set_params
      @event = Event.find(params[:id])
    end

    def get_event_in_month
      start_date = params.fetch(:start_date, Date.today).to_date
      @events = Event.only_events.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week, user: current_user)
    end
  
end