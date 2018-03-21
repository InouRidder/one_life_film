class AddRequestToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :request, foreign_key: true
  end
end
