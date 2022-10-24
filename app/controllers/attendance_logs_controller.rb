class AttendanceLogsController < ApplicationController
  DATETIME = DateTime.now
  
  def check_in
    @attendance = AttendanceLog.new(check_in_at: DATETIME, is_check_in: true, date: DATETIME.to_date)
    @attendance.user = current_user
    if @attendance.save
    else
      render_toast('Error', full_mes(@attendance), 'error')
    end
  end

  def check_out
    @attendance = AttendanceLog.find_by(user_id: current_user.id , date: DATETIME.to_date, is_check_out: false)
    if @attendance.nil?
      render_toast('Error', 'You checked out today!', 'error')
    else 
      if @attendance.update(check_out_at: DATETIME, is_check_out: true)
      else
        render_toast('Error', full_mes(@attendance), 'error')
      end
    end
  end

end
