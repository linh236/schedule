class CreateAttendanceLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :attendance_logs do |t|
      t.datetime :check_in_at
      t.datetime :check_out_at
      t.boolean :is_check_in, default: false
      t.boolean :is_check_out, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
