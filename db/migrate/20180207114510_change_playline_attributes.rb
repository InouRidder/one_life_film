class ChangePlaylineAttributes < ActiveRecord::Migration[5.1]
  def change
    add_column :playlines, :contact, :string
    add_column :playlines, :phone_number, :string
    remove_column :playlines, :end_time
  end
end
