class CreateFormLines < ActiveRecord::Migration[5.1]
  def change
    create_table :form_lines do |t|
      t.string :line
      t.references :booking_form
      t.timestamps
    end
  end
end
