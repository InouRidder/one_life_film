class UpdatePlaylineAttributes < ActiveRecord::Migration[5.1]
  def change
    remove_column :playlines, :location
    add_column :playlines, :city, :string
    add_column :playlines, :address, :string
  end
end
