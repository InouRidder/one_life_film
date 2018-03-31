class Song < ApplicationRecord
  has_many :song_choices
  belongs_to :category

  paginates_per 10

  scope :slow, -> { where(label: "slow")}
  scope :medium, -> { where(label: "med")}
  scope :up, -> { where(label: "up")}

  include PgSearch
  pg_search_scope :search_by_name, :against => [:name]

end
