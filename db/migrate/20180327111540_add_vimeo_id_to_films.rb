class AddVimeoIdToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :vimeo_id, :string
  end
end
