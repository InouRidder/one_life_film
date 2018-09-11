class Booking < ApplicationRecord
  include PgSearch
  has_many :comments, as: :commentable
  by_star_field :date_wedding
  after_create :add_suggestive_lines

  default_scope { order(date_wedding: :asc) }

  paginates_per 20

  belongs_to :user, optional: true
  belongs_to :request, optional: true
  has_one :film, dependent: :nullify
  has_many :playlines, dependent: :destroy
  has_many :song_choices, dependent: :destroy
  has_many :songs, through: :song_choices
  pg_search_scope :search_by_text, :against => [:name, :location_wedding, :email_address]

  validates :name, presence: true
  validates :email_address, presence: true
  validates :location_wedding, presence: true
  validates :date_wedding, presence: true

  after_create :booking_services

  scope :active, -> { where("state != 'declined' AND date_wedding >= ? ", Date.today)}
  scope :this_month, -> { where('date_wedding BETWEEN ? AND ?', Date.current.beginning_of_month, (Date.current + 1.months).end_of_month) }
  scope :this_week, -> { where('date_wedding BETWEEN ? AND ?', Date.current.beginning_of_week, (Date.current + 1.months).end_of_week) }
  scope :old, -> { where('date_wedding <=  ? ', Date.today) }

  # REAL TIME DATA : RT

  scope :rt_bookings, -> {active.where("request = 'false'").count}

  def filmed?
    filmed
  end

  def filmed!
    self.filmed = true
  end

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

  def add_suggestive_lines
    Playline::SUGGESTED_LINES.each do |prereq|
      playline = Playline.new(prereq)
      playline.booking = self
      playline.save
    end
  end
end
