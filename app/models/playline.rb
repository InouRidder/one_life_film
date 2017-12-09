class Playline < ApplicationRecord
  belongs_to :playbook
  validates :location, :content, presence: true
  validates :content, length: { minimum: 10 }
end
