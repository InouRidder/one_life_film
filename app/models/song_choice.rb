class SongChoice < ApplicationRecord
  belongs_to :booking
  belongs_to :song
end
