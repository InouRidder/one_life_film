class SongChoice < ApplicationRecord
  belongs_to :playbook
  belongs_to :song, optional: true
end
