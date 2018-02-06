class Playbook < ApplicationRecord
  belongs_to :booking
  has_many :playlines
  has_many :song_choices
end
