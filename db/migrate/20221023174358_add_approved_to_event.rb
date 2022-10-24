class AddApprovedToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :approved, :boolean, default: false
  end
end
