class DropPasswords < ActiveRecord::Migration[5.0]
  def change
    drop_table :passwords
  end
end
