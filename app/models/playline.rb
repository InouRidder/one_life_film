class Playline < ApplicationRecord
  belongs_to :playbook
  validates :location, :content, presence: true
  validates :content, length: { minimum: 10 }

  def set_order
    self.order_number = self.playbook.playlines.length + 1
  end
end
