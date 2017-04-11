class AddPasswordToFilm < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :password, :string, default: nil
  end
end
