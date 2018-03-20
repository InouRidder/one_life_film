class Booking < ApplicationRecord
  include PgSearch

  belongs_to :user, optional: true
  has_one :playbook
  has_many :song_choices
  has_many :songs, through: :song_choices

  pg_search_scope :search_by_name_and_location_wedding, :against => [:name, :location_wedding]

  # validates :phone_number, presence: true, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/, message: "please enter a valid phonenumber" }
  # validates :name, presence: true
  # validates :email_address, presence: true
  # validates :location_wedding, presence: true
  # validates :date_wedding, presence: true, inclusion: { in: [Date.today..(Date.today + 730)] }
  # validates :description, presence: true
  scope :def, -> { where(request: :false)}
  scope :declined, -> { where(status: 'declined') }
  scope :requests, -> { where(request: true) }
  scope :this_month, -> { where('date_wedding BETWEEN ? AND ?', Date.current.beginning_of_month, (Date.current + 1.months).end_of_month) }
  scope :this_week, -> { where('date_wedding BETWEEN ? AND ?', Date.current.beginning_of_week, (Date.current + 1.months).end_of_week) }
  scope :old, -> { where('date_wedding <=  ? ', Date.today) }
  scope :cancels, -> { where("date_wedding <  ? ", Date.today) + declined }

# TO DO : bugs on booking index admin, aantal boekingen in OLD BOEKINGS veranderd niet
  def approved?
    status == 'approved'
  end

  def approve
    self.request = false
  end

  def declined?
    status == 'declined'
  end

  def update_state(new_status)
    self.status = new_status
  end

  def days_till_wedding
    (Date.today - self.date_wedding).to_i
  end

  def checklist
    self.attributes.slice("phone_number", "name", "email_address", "location_wedding", "date_wedding", "groom_number")
  end

  def decline
    self.status = 'declined'
  end

  # should be decorator, but cant be with current draper gem - as it used by a different controller (requests)
  def btn_state(btn)
    if btn == self.status
      "active-#{btn}"
    end
  end
end
