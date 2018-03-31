class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.string :spotify_uri
      t.string :label
      t.timestamps
    end
  end
end
