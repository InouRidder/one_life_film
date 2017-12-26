class Booking < ApplicationRecord
  belongs_to :user, optional: true
  has_one :playbook

  # validates :phone_number, presence: true, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/, message: "please enter a valid phonenumber" }
  # validates :name, presence: true
  # validates :email_address, presence: true
  # validates :location_wedding, presence: true
  # validates :date_wedding, presence: true, inclusion: { in: [Date.today..(Date.today + 730)] }
  # validates :description, presence: true
  def approve
    if self.name && self.email_address
      self.status = 'approved'
    end
  end
end
