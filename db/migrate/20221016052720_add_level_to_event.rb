class AddLevelToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :level, :integer, default: 1
  end
end
