class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :music
      t.string :location
      t.references :request
      t.timestamps
    end
  end
end
