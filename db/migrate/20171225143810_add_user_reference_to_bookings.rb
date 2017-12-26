class AddUserReferenceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :user
  end
end
