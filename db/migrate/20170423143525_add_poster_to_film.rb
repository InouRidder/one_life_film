class AddPosterToFilm < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :poster, :string
  end
end
