class DropTables < ActiveRecord::Migration[5.1]
  def change
    remove_reference :songs, :category
    drop_table :categories
  end
end
