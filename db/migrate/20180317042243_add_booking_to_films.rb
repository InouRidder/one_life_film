class AddBookingToFilms < ActiveRecord::Migration[5.1]
  def change
    add_reference :films, :booking, foreign_key: true
  end
end
