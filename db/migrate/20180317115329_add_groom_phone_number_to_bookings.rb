class AddGroomPhoneNumberToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :groom_number, :string
  end
end
