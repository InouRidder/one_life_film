class Booking < ApplicationRecord
  include PgSearch
  has_many :comments, as: :commentable


  belongs_to :user, optional: true
  belongs_to :request, optional: true
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
  after_create :booking_services

  scope :active, -> { where("state != 'declined' AND date_wedding >= ? ", Date.today)}
  scope :this_month, -> { where('date_wedding BETWEEN ? AND ?', Date.current.beginning_of_month, (Date.current + 1.months).end_of_month) }
  scope :this_week, -> { where('date_wedding BETWEEN ? AND ?', Date.current.beginning_of_week, (Date.current + 1.months).end_of_week) }
  scope :old, -> { where('date_wedding <=  ? ', Date.today) }

  # REAL TIME DATA : RT

  scope :rt_bookings, -> {active.where("request = 'false'").count}


# TO DO : bugs on booking index admin, aantal boekingen in OLD BOEKINGS veranderd niet

  def update_state(new_state)
    self.state = new_state
  end

  def days_till_wedding
    (Date.today - self.date_wedding).to_i
  end

  def checklist
    self.attributes.slice("phone_number", "name", "email_address", "location_wedding", "date_wedding", "groom_number")
  end

  def booking_services
    BookingServices.new(self).approve
  end

  # should be decorator, but cant be with current draper gem - as it used by a different controller (requests)

end
