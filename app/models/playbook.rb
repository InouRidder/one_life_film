class Playbook < ApplicationRecord
  belongs_to :booking
  has_many :playlines
end
