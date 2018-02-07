class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :active_admin_comments
    drop_table :form_lines
    drop_table :booking_forms
    remove_reference :songs, :category
    drop_table :categories
  end
end
