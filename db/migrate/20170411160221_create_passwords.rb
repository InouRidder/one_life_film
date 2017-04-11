class CreatePasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :passwords do |t|
      t.string :password
      t.references :film

      t.timestamps
    end
  end
end
