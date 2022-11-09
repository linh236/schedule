class CreateApproves < ActiveRecord::Migration[7.0]
  def change
    create_table :approves do |t|
      t.references :event, null: false, foreign_key: true
      t.string :user_id
      t.boolean :is_approved, default: false
      t.text :note

      t.timestamps
    end
    add_index :approves, :user_id
  end
end
