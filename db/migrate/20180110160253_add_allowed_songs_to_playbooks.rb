class AddAllowedSongsToPlaybooks < ActiveRecord::Migration[5.1]
  def change
    add_column :playbooks, :allowed_songs, :integer, default: 3
  end
end
