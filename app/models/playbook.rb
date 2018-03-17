class Playbook < ApplicationRecord
  belongs_to :booking
  has_many :playlines
  has_many :song_choices
  after_create :add_suggestive_lines

  def add_suggestive_lines
    prerequisites = Playline::SUGGESTED_LINES
    prerequisites.each do |prereq|
      self.playlines.build(prereq).save
    end
  end
end
