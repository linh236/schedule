class AddUserColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :birthday, :date
    add_column :users, :phone, :string
  end
end
