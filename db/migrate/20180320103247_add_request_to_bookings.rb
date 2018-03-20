class AddRequestToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :request, :boolean, default: true
  end
end
