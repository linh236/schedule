class LeavesController < ApplicationController
  before_action :set_params, only: [:show, :edit, :destroy]
  def index
    if params[:month_of_year].present?
      month_of_year = ("#{params[:month_of_year]}-1").to_datetime
    else
      month_of_year = Date.today.to_datetime
    end
  
    if params[:status] == 2.to_s
      @leaves = Approve.approved.filter_approve(month_of_year).order(created_at: :desc)
    elsif params[:status] == 3.to_s
      @leaves = Approve.disapproved.filter_approve(month_of_year).order(created_at: :desc)
    else
      @leaves = Approve.approve_process.filter_approve(month_of_year).order(created_at: :desc)
    end
  end

  def show
  end

  def destroy
    @leave.event.delete
    @leave.destroy
  end

  private

    def set_params
      @leave = Approve.find(params[:id])
    end
end
