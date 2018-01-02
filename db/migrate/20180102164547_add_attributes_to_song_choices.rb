class AddAttributesToSongChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :song_choices, :title, :string
    add_column :song_choices, :artist, :string
  end
end
