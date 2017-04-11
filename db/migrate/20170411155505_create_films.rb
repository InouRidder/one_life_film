class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :name
      t.string :video_url
      t.text :slug

      t.timestamps
    end
  end
end
