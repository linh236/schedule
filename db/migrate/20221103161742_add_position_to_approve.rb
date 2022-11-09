class AddPositionToApprove < ActiveRecord::Migration[7.0]
  def change
    add_column :approves, :position, :integer, unique: true
  end
end
