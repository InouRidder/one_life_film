class AddOrderNumberToPlaylines < ActiveRecord::Migration[5.1]
  def change
    add_column :playlines, :order_number, :integer
  end
end
