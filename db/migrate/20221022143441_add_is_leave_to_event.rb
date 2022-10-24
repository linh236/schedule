class AddIsLeaveToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_leave, :boolean, default: false
  end
end
