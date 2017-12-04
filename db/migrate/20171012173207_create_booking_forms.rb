class CreateBookingForms < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_forms do |t|
      t.references :booking
      t.string :wedding_plan
      t.timestamps
    end
  end
end
