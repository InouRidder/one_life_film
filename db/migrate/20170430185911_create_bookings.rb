class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :phone_number
      t.string :name
      t.string :email_address
      t.string :location_wedding
      t.date :date_wedding
      t.string :subject

      t.timestamps
    end
  end
end
