class AddDressCodeToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :dress_code, :string
  end
end
