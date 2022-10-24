class AddDateToAttendanceLog < ActiveRecord::Migration[7.0]
  def change
    add_column :attendance_logs, :date, :date
  end
end
