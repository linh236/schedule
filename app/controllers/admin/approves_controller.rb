class Admin::ApprovesController < AdminController
  before_action :set_params, only: [:show, :update, :disapprove]

  def index
    filter_approve
  end

  def create 
    from = Approve.find(params[:from])
    if from.update(position: params[:position_to])

    else

    end
    to = Approve.find(params[:to])
    if to.update(position: params[:position_from])
      
    else

    end
    filter_approve
  end
  
  def show
    
  end

  def update
    if @approve.update(is_approved: true, user_id: current_user.id, note: nil)
    else
    end
  end

  def disapprove
    if @approve.update(is_approved: false, user_id: current_user.id, note: params[:note])
    else
    end
  end

  private 

    def set_params
      @approve = Approve.find(params[:id])
    end

    def filter_approve
      if params[:month_of_year].present?
        month_of_year = ("#{params[:month_of_year]}-1").to_datetime
      else
        month_of_year = Date.today.to_datetime
      end
    
      if params[:status] == 2.to_s
        @approves = Approve.approved.filter_approve(month_of_year).order(position: :asc, created_at: :desc)
      elsif params[:status] == 3.to_s
        @approves = Approve.disapproved.filter_approve(month_of_year).order(position: :asc, created_at: :desc)
      else
        @approves = Approve.approve_process.filter_approve(month_of_year).order(position: :asc, created_at: :desc)
      end
    end

end