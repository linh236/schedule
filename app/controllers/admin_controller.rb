class AdminController < ApplicationController
  layout 'admin'

  before_action :approve_count, :check_role_login

  private
    def approve_count 
      @approve_count = Approve.approve_process.size
    end
    
    def check_role_login
      redirect_to root_path unless user_signed_in? && current_user.role == 'admin'
    end
end