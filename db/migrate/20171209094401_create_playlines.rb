class CreatePlaylines < ActiveRecord::Migration[5.1]
  def change
    create_table :playlines do |t|
      t.references :playbook, foreign_key: true
      t.string :content
      t.string :location
      t.time :begin_time
      t.time :end_time

      t.timestamps
    end
  end
end
