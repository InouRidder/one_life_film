class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :phone_number
      t.string :names
      t.string :email_address
      t.string :location_wedding
      t.string :subject
      t.string :message
      t.string :source_reference
      t.date :date_wedding
      t.string :state, default: 'pending'

      t.timestamps
    end
  end
end
