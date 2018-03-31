class CreateSongChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :song_choices do |t|
      t.references :booking, foreign_key: true
      t.references :song, foreign_key: true
      t.string :artist
      t.string :title

      t.timestamps
    end
  end
end
