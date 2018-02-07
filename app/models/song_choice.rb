class SongChoice < ApplicationRecord
  belongs_to :playbook
  belongs_to :song, optional: true
  validates :title, :artist, presence: true
  validate :max_allowed_songs

  private

  def max_allowed_songs
    if self.playbook.allowed_songs <= self.playbook.song_choices.count
      errors.add(:maximum_songs, "reached (#{self.playbook.allowed_songs})")
    # else
    #   true
    end
  end
end
