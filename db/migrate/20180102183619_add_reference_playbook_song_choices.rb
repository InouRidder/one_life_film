class AddReferencePlaybookSongChoices < ActiveRecord::Migration[5.1]
  def change
    add_reference :song_choices, :playbook, foreign_key: true, index: true
  end
end
