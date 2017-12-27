class Song < ApplicationRecord
  has_many :song_choices
  belongs_to :category

  paginates_per 10

  scope :begin, -> { where(category_id: 1)}
  scope :middle, -> { where(category_id: 2)}
  scope :end, -> { where(category_id: 3)}

  include PgSearch
  pg_search_scope :search_by_name, :against => [:name]

end
