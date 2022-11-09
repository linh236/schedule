class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    get_event_in_month
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    get_event_in_month
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      get_event_in_month
    else
      render_toast('Error', full_mes(@event), 'error')
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
       
      else

      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :note, :level, :is_leave)
    end

    def get_event_in_month
      start_date = params.fetch(:start_date, Date.today).to_date
      @events = Event.only_events.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week, user: current_user)
    end
  
end
