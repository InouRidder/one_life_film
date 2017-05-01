class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :phonenumber
      t.string :name
      t.string :emailaddress
      t.string :concerns
      t.string :location_wedding
      t.string :date_wedding
      t.string :subject
      t.string :description

      t.timestamps
    end
  end
end
