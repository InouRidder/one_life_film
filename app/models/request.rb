class Request < ApplicationRecord

  validates :phonenumber, presence: true, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/ }
  validates :name, presence: true
  validates :emailaddress, presence: true
  validates :concerns, presence: true
  validates :location_wedding, presence: true
  validates :date_wedding, presence: true, inclusion: [Date.today..Date.today + 365.days ]
  validates :subject, presence: true
  validates :description, presence: true

end
