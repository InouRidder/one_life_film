class Booking < ApplicationRecord
  belongs_to :user, optional: true
  has_one :playbook

  include PgSearch
  pg_search_scope :search_by_name_and_location_wedding, :against => [:name, :location_wedding]

  # validates :phone_number, presence: true, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/, message: "please enter a valid phonenumber" }
  # validates :name, presence: true
  # validates :email_address, presence: true
  # validates :location_wedding, presence: true
  # validates :date_wedding, presence: true, inclusion: { in: [Date.today..(Date.today + 730)] }
  # validates :description, presence: true

  scope :approved, -> { where(status: 'approved') }
  scope :declined, -> { where(status: 'declined') }
  scope :requests, -> { where(status: 'pending') }
  scope :this_month, -> { where('date_wedding BETWEEN ? AND ?', Date.current.beginning_of_month, (Date.current + 1.months).end_of_month) }
  scope :this_week, -> { where('date_wedding BETWEEN ? AND ?', Date.current.beginning_of_week, (Date.current + 1.months).end_of_week) }
  scope :old, -> { where('date_wedding <=  ? ', Date.today) }
  scope :old_requests, -> { where("date_wedding <  ? ", Date.today) + declined }

# TO DO : bugs on booking index admin, aantal boekingen in OLD BOEKINGS veranderd niet
  def approved?
    status == 'approved'
  end

  def declined?
    status == 'declined'
  end

  def approve
    if self.name && self.email_address
      self.status = 'approved'
    end
  end

  def decline
    self.status = 'declined'
  end
end
