class AddStateToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :state, :string, default: "definitief"
  end
end
