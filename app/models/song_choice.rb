class SongChoice < ApplicationRecord
  belongs_to :booking
  belongs_to :song, optional: true
  validates :title, :artist, presence: true
  validate :max_allowed_songs

  private

  def max_allowed_songs
    if self.booking.max_songs <= self.booking.song_choices.count
      errors.add(:maximum_songs, "reached (#{self.booking.max_songs})")
   end
  end
end
