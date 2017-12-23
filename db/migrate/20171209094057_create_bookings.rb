class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :wedding_date
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
