class AddNoteToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :note, :text
  end
end
