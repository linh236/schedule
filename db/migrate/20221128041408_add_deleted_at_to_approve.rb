class AddDeletedAtToApprove < ActiveRecord::Migration[7.0]
  def change
    add_column :approves, :deleted_at, :datetime
  end
end
