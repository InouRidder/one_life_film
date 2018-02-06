class RemoveReferencePlaybookSongChoices < ActiveRecord::Migration[5.1]
  def change
    remove_reference :song_choices, :booking, foreign_key: true
  end
end
